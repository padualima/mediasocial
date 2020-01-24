require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /homes" do
    it "return status 200 at index" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end
end


adding few unit tests
