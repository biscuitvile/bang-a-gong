class Engine < Thor
  require 'active_support/all'
  include Thor::Actions

  desc "rename", "renames the engine, rvm gemset & project directory"
  def rename

    new_name = ''

    while new_name == '' do
      new_name = ask("Please enter a new engine name:").underscore
    end

    classy_name = new_name.camelize

    puts "Renaming locomotive to #{new_name}..."

    files_to_gsub = [
      '.rvmrc',
      'app/controllers/locomotive/application_controller.rb',
      'app/helpers/locomotive/application_helper.rb',
      'app/views/layouts/locomotive/application.html.erb',
      'config/routes.rb',
      'Gemfile',
      'Gemfile.lock',
      'lib/locomotive.rb',
      'lib/locomotive/engine.rb',
      'lib/locomotive/version.rb',
      'lib/tasks/locomotive_tasks.rake',
      'locomotive.gemspec',
      'Rakefile',
      'README.rdoc',
      'script/rails',
      'spec/dummy/config/application.rb',
      'spec/dummy/config/routes.rb',
    ]

    # figure out '.git/config' and '.git/index' later

    files_to_gsub.each do |file|
      gsub_file file, /locomotive/, new_name
      gsub_file file, /Locomotive/, classy_name
    end

    directories_to_rename = [
      'app/assets/images/locomotive',
      'app/assets/javascripts/locomotive',
      'app/assets/stylesheets/locomotive',
      'app/controllers/locomotive',
      'app/helpers/locomotive',
      'app/views/layouts/locomotive',
      'lib/locomotive',
    ]

    directories_to_rename.each do |dir|
      FileUtils.mv dir, dir.gsub('locomotive', new_name)
    end

    files_to_rename = [
      'lib/locomotive.rb',
      'lib/tasks/locomotive_tasks.rake',
      'locomotive.gemspec',
    ]

    files_to_rename.each do |file|
      File.rename file, file.gsub('locomotive', new_name)
    end

    FileUtils.mv '../locomotive', '../' + new_name

    puts "Done! Remember the directory you're in and gemset you're using have both just had their names changed."
  end
end
