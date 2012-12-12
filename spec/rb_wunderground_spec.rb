require 'rb_wunderground'

describe RbWunderground::Base do

  describe "initialization" do
    before { @w = RbWunderground::Base.new('fake_api_key') }

    it "sets the API key on initialization" do
      @w.api_key.should eql('fake_api_key')
    end

    it "has a base url containing the API key" do
      @w.base_url.should eql("http://api.wunderground.com/api/fake_api_key/")
    end
  end

end