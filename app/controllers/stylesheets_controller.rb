class StylesheetsController < AssetsController

  private

  def set_headers
    headers['Content-Type'] = 'text/css; charset=utf-8'
  end
end
