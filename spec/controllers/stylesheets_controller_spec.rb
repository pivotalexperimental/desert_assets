require File.dirname(__FILE__) + '/../spec_helper'

describe StylesheetsController do
  before do
    add_fixture_views(StylesheetsController)
  end

  describe "when a matching file is found in public" do
    it "renders the file" do
      get "asset", :format => "css"
      response.body.should match(Regexp.new('/fixtures/public/stylesheets/asset.css'))
    end
  end

  describe "when a matching file is found in app, but not in public" do
    it "renders the file" do
      get "app_asset", :format => "css"
      response.should render_template('stylesheets/app_asset')
    end
  end
  
  describe "when a matching file is not found" do
    it "raises" do
      lambda {
        get "bogus", :format => "css"
      }.should raise_error
    end
  end
end
