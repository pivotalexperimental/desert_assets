class ImagesController < AssetsController
  def render_with_image_view(options = nil, extra_options = {}, &block)
    params = request.parameters
    format = params[:format]
    options = {
      :status => 200,
      :filename => "#{params[:action]}.#{format}",
      :disposition => 'inline',
      :type => "image/#{format}"
    }
    
    data = render_to_string
    send_file_headers! options.merge(:text => data, :length => data.size)
    @performed_render = false
    render_without_image_view options
  end
  alias_method_chain :render, :image_view
  
  def render_to_string(options = nil, &block)
    render_without_image_view(options, &block)
  ensure
    erase_render_results
    forget_variables_added_to_assigns
    reset_variables_added_to_assigns
  end
end
