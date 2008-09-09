class AssetsController < ApplicationController
  before_filter :set_headers
  after_filter { |controller| controller.cache_page }
  session :off
  layout nil
  
  private
  
  def set_headers
    # optionally override
  end
end
