require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe JavascriptsController do
  describe "route generation" do
    it "should map #asset" do
      route_for(:controller => "javascripts", :action => "asset", :format => "js").should == "/javascripts/asset.js"
    end
  end

  describe "route recognition" do
    it "should generate params for #asset" do
      params_from(:get, "/javascripts/asset.js").should == {:controller => "javascripts", :action => "asset", :format => "js"}
    end
  end
end
