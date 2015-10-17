RSpec.describe Template do
  it "respond_to body" do
    expect(subject).to respond_to(:body)
  end

  it "respond_to name" do
    expect(subject).to respond_to(:name)
  end

  it "respond_to kind" do
    expect(subject).to respond_to(:kind)
  end

  it "respond_to params" do
    expect(subject).to respond_to(:params)
  end

end
