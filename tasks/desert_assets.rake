namespace :desert_assets do
  desc "Renders plugin-provided assets to RAILS_ROOT/public."
  task :render_all => :environment do
    Rake::Task[ "desert_assets:render_js" ].invoke
    Rake::Task[ "desert_assets:render_css" ].invoke
  end
  
  desc "Renders plugin-provided app/views/javascripts/**/* files to public/javascripts."
  task :render_js => :environment do
    render('javascripts', 'js')
  end
  
  desc "Renders plugin-provided app/views/stylesheets/**/* files to public/stylesheets."
  task :render_css => :environment do
    render('stylesheets', 'css')
  end
  
  def render(dirname, extension)
    Desert::Manager.plugins_and_app.each do |plugin|
      load_path = "#{plugin.templates_path}/#{dirname}"
      templates = Dir["#{load_path}/**/*"]
      
      unless templates.empty?
        templates.each do |template_path|
          relative_path = template_path.gsub(plugin.templates_path, '')
          target_path = File.join(RAILS_ROOT, 'public', relative_path.gsub(Regexp.new("\.#{extension}\.[a-z]+$"), ".#{extension}"))
          
          view = ActionView::Base.new(File.join(RAILS_ROOT, 'app', 'views'))
          content = view.render(relative_path)
          File.open(target_path, 'w') {|f| f.write(content) }
        end
      end
    end
  end
end
