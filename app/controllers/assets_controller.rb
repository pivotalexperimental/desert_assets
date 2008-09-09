class AssetsController < ApplicationController
  before_filter :set_headers
  after_filter { |controller| controller.cache_page }
  session :off
  layout nil
  
  def render_with_public(options = nil, extra_options = {})
    public_file = find_public

    render_without_public(:file => public_file) and return if public_file
    render_without_public(options, extra_options)
  end
  alias_method_chain :render, :public
  
  private
  
  def set_headers
    # optionally override
  end

  def find_public
    params = request.parameters
    sub_path = "#{params[:controller]}/#{params[:action]}.#{params[:format]}"
  
    view_paths.each do |view_path|
      absolute_path = File.join(view_path, sub_path)
      return absolute_path if File.exists? absolute_path
    end
    
    nil
  end
end
