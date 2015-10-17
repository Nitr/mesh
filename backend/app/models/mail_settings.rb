class MailSettings
  include Mongoid::Document
  field :delivery_method
  field :port
  field :address
  field :user_name
  field :password
  field :authentication

  embedded_in :environment
end
