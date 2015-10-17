describe API do
  include Rack::Test::Methods

  def app
    API
  end

  describe "GET /environments" do
    it "get list of environments" do
      get '/environments'
      expect(last_response).to be_successful
    end
  end

  describe "GET /environments/:id" do
    let(:environment){create :environment }

    it "get environments" do
      get "/environments/#{environment.id}"
      expect(last_response).to be_successful
    end
  end

  describe "DELETE /environments/:id" do
    let(:environment){create :environment }

    it "delete environment" do
      delete "/environments/#{environment.id}"
      expect(last_response).to be_successful
    end
  end

  describe "POST /environments" do
    let(:environment_params){
      {
        env: 'stage',
        mail_settings:{
          delivery_method: 'smtp',
          port: 25,
          address: 'smtp.example.com',
          user_name: 'user_name',
          user_password: 'user_password',
          authentication: 'plain',
          password: 'password'
        }
      }
    }
    it "create environment" do
      post "/environments", environment_params
      expect(last_response).to be_successful
    end
  end


  describe "POST /environments" do
    let(:environment){create :environment}
    let(:environment_params){
      {
        env: 'stage2',
        mail_settings:{
          password: 'password',
          delivery_method: 'smtp2',
          port: 26,
          address: 'smtp2.example.com',
          user_name: 'user_name2',
          user_password: 'user_password2',
          authentication: 'plain'
        }
      }
    }
    it "update environment" do
      put "/environments/#{environment.id}", environment_params
      expect(last_response).to be_successful
    end
  end
end

