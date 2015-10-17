class API < Grape::API
  namespace :environments do
    get do
      environments = Environment.all
      present environments, with: Entities::Environment
    end

    params do
      requires :env, type:String, regexp: /\w+/
      optional :mail_settings, type:Hash do
        requires :delivery_method, type:String
        requires :port, type:Integer
        requires :address, type:String
        requires :user_name, type:String
        requires :password, type:String
        requires :authentication, type:String, values: %w(plain)
      end
    end
    post do
      environment = Environment.create declared(params, include_missing: false)
      present environment, with: Entities::Environment
    end

    namespace ':id', requirements: { id: /[0-9]*/ } do
      helpers do
        def environment
          @environment ||= Environment.where(id: params.id).first!
        end
      end

      get do
        present environment, with: Entities::Environment
      end

      params do
        requires :env, type:String, regexp: /\w+/
        optional :mail_settings, type:Hash do
          requires :delivery_method, type:String
          requires :port, type:Integer
          requires :address, type:String
          requires :user_name, type:String
          requires :password, type:String
          requires :authentication, type:String, values: %w(plain)
        end
      end
      put do
        environment.update declared(params, include_missing: false)
        present environment, with: Entities::Environment
      end

      delete do
        environment.destroy
        status 200
      end
    end
  end

  namespace :templates do
    params do
      optional :kind, type:String, values:%w(mail push sms)
    end
    get do
      templates = Template.dataset
      templates.where(kind: params.kind) if params.kind

      present templates.all, with: Entities::Template
    end

    params do
      optional :params, type:Array do
        requires :name, type:String, regexp: /\w+/
        requires :required, type:Boolean, default: true
      end

      requires :kind, type:String, values: %w(mail push sms)
      requires :body_template, type:String
      requires :subject_template, type:String
    end
    post do
      template = Template.create declared(params, include_missing: false)

      present template, with: Entities::Template
    end

    namespace ':id', requirements: { id: /[0-9]*/ }  do
      helpers do
        def template
          @template ||= Template.where(id: params.id).first!
        end
      end

      get do
        present template, with: Entities::Template
      end

      params do
        optional :params, type:Array do
          requires :name, type:String, regexp: /\w+/
          requires :required, type:Boolean
        end

        requires :kind, type:String, values: %w(mail push sms)
        requires :body_template, type:String
        requires :subject_template, type:String
      end
      put do
        template.update declared(params, include_missing: false)
        present template, with: Entities::Template
      end

      delete do
        template.destroy
        status 200
      end
    end
  end

  params do
    requires :env, type:String
    requires :template_id, type:String
  end
  namespace :mail do
    helpers do
      def environment
        @environment ||= Environment.where(env: params.env).first!
      end

      def template
        @template ||= Template.mails.where(id: params.template_id).first!
      end
    end

    params do
      requires :from, type:String

      optional :bcc, type:String
      optional :cc,  type:String
      optional :to,  type:String
      optional :template_params, type:Hash

      at_least_one_of :bcc, :cc, :to
    end
    post do
      mail = Mail.new
      mail.bcc = params.bcc if params.bcc
      mail.cc  = params.cc  if params.cc
    end
  end
end
