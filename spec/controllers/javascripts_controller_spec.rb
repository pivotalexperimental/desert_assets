require File.dirname(__FILE__) + '/../spec_helper'

describe JavascriptsController do
  integrate_views

  before do
    add_fixture_views(JavascriptsController)
  end

  it "renders" do
    get "asset", :format => "js"
    response.should render_template("javascripts/asset")
  end
end