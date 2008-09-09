require File.dirname(__FILE__) + '/../spec_helper'

describe StylesheetsController do
  integrate_views

  before do
    add_fixture_views(StylesheetsController)
  end

  it "renders" do
    get "asset", :format => "css"
    response.should render_template("stylesheets/asset")
  end
end