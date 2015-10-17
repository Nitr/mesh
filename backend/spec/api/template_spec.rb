describe API do
  include Rack::Test::Methods

  def app
    API
  end

  describe "GET /templates" do
    it "get list of templates" do
      get '/templates'
      expect(last_response).to be_successful
    end
  end

  describe "GET /templates/:id" do
    let(:template){create :template }

    it "get templates" do
      get "/templates/#{template.id}"
      expect(last_response).to be_successful
    end
  end

  describe "DELETE /templates/:id" do
    let(:template){create :template }

    it "delete template" do
      delete "/templates/#{template.id}"
      expect(last_response).to be_successful
    end
  end

  describe "POST /templates" do
    let(:template_params){
      {
        params: [
          {name: 'test_body',    required: true},
          {name: 'test_subject', required: true},
        ],
        name: "template_1",
        kind: 'mail',
        body_template: "{{ test_body }}",
        subject_template: "{{ test_subject }}"
      }
    }
    it "create template" do
      post "/templates", template_params
      expect(last_response).to be_successful
    end
  end


  describe "POST /templates" do
    let(:template){create :template}
    let(:template_params){
      {
        params: [
          {name: 'test_body',    required: true},
          {name: 'test_subject', required: true},
        ],
        name: "template_1",
        kind: 'mail',
        body_template: "{{ test_body }}",
        subject_template: "{{ test_subject }}"
      }
    }

    it "update template" do
      put "/templates/#{template.id}", template_params
      expect(last_response).to be_successful
    end
  end
end

