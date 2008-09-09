require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ImagesController do
  describe "route generation" do
    it "should map #asset" do
      route_for(:controller => "images", :action => "asset", :format => "png").should == "/images/asset.png"
    end
  end

  describe "route recognition" do
    it "should generate params for #asset" do
      params_from(:get, "/images/asset.png").should == {:controller => "images", :action => "asset", :format => "png"}
    end
  end
end
