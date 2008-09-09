require File.dirname(__FILE__) + '/../spec_helper'

describe JavascriptsController do
  before do
    add_fixture_views(JavascriptsController)
  end

  describe "when a matching file is found in public" do
    it "renders the file" do
      get "asset", :format => "js"
      response.body.should match(Regexp.new('/fixtures/public/javascripts/asset.js'))
    end
  end

  describe "when a matching file is found in app, but not in public" do
    it "renders the file" do
      get "app_asset", :format => "js"
      response.should render_template('javascripts/app_asset')
    end
  end
  
  describe "when a matching file is not found" do
    it "raises" do
      lambda {
        get "bogus", :format => "txt"
      }.should raise_error
    end
  end
end
