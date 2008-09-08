namespace :desert_assets do
  desc "Renders plugin-provided app/views/javascripts/**/* files to public/javascripts."
  task :render_js => :environment do
    render_js
  end
  
  def render_js
    Desert::Manager.plugins_and_app.each do |plugin|
      javascript_load_path = "#{plugin.templates_path}/javascripts"
      javascript_templates = Dir["#{javascript_load_path}/**/*"]
      
      unless javascript_templates.empty?
        javascript_templates.each do |template_path|
          relative_path = template_path.gsub(plugin.templates_path, '')
          target_path = File.join(RAILS_ROOT, 'public', relative_path.gsub(/\.js\..*$/, '.js'))
          
          view = ActionView::Base.new(File.join(RAILS_ROOT, 'app', 'views'))
          content = view.render(relative_path)
          File.open(target_path, 'w') {|f| f.write(content) }
        end
      end
    end
  end
end
