RSpec.describe MailSettings do
  it "respond_to delivery_method" do
    expect(subject).to respond_to(:delivery_method)
  end

  it "respond_to port" do
    expect(subject).to respond_to(:port)
  end

  it "respond_to address" do
    expect(subject).to respond_to(:address)
  end

  it "respond_to user_name" do
    expect(subject).to respond_to(:user_name)
  end

  it "respond_to password" do
    expect(subject).to respond_to(:password)
  end

  it "respond_to authentication" do
    expect(subject).to respond_to(:authentication)
  end

end
