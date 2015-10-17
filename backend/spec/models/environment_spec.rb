RSpec.describe Environment do
  it "respond_to env" do
    expect(subject).to respond_to(:env)
  end

  it "respond_to mail_settings" do
    expect(subject).to respond_to(:mail_settings)
  end
end
