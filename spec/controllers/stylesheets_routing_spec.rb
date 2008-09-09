require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StylesheetsController do
  describe "route generation" do
    it "should map #asset" do
      route_for(:controller => "stylesheets", :action => "asset", :format => "css").should == "/stylesheets/asset.css"
    end
  end

  describe "route recognition" do
    it "should generate params for #asset" do
      params_from(:get, "/stylesheets/asset.css").should == {:controller => "stylesheets", :action => "asset", :format => "css"}
    end
  end
end
