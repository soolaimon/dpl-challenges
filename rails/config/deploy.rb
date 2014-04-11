set :application, "johnsgym"
set :user, "deploy"

set :location, '127.0.0.1'
set :repository,  "ssh://#{user}@#{location}/var/git/#{application}.git"
set :deploy_to, "/var/rails/#{application}"

role :web, location
role :app, location
role :db,  location, :primary => true

set :use_sudo, false
default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :scm, :git
set :branch, "master"
set :bundle_cmd, '/opt/ruby-enterprise/bin/bundle'

namespace :passenger do
  desc 'Restart Application'
  task :restart, :roles => :app do
    run "touch #{latest_release}/tmp/restart.txt"
  end
end

namespace :apache do
  %w( start stop restart ).each do |name|
    desc "#{name} the apache servers"
    task name.to_sym, :roles => :app do
      run "sudo /etc/init.d/apache2 #{name}"
    end
  end
end

namespace :bundler do
  task :create_symlink, :roles => :app do
    set :bundle_dir, File.join(release_path, 'vendor/bundle')
    shared_dir = File.join(shared_path, 'bundle')
    run "rm -rf #{bundle_dir}"
    run("mkdir -p #{shared_dir} && ln -s #{shared_dir} #{bundle_dir}")
  end

  task :bundle_new_release, :roles => :app do
    bundler.create_symlink
    run "cd #{release_path} ; #{bundle_cmd} install --path #{bundle_dir}"
  end
end

namespace :deploy do
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc 'Move config/database.yml.production to config/database.yml'
  task :set_database_yml, :except => { :no_release => true } do
    run "mv #{latest_release}/config/database.yml.production #{latest_release}/config/database.yml"
  end

  desc "Create asset packages for production"
  task :after_update_code, :roles => [:web] do
    run "cd #{release_path} && rake asset:packager:build_all"
  end

  desc 'Symlink Files for application servers'
  task :symlink_files_app, :roles => :app do
    run "ln -nfs #{shared_path}/public/assets/advertisements #{latest_release}/public/assets/advertisements"
    run "ln -nfs #{shared_path}/public/assets/billboards #{latest_release}/public/assets/billboards"
    run "ln -nfs #{shared_path}/public/assets/gallery_photos #{latest_release}/public/assets/gallery_photos"
    run "ln -nfs #{shared_path}/public/assets/instructors #{latest_release}/public/assets/instructors"
    run "ln -nfs #{shared_path}/public/assets/specials #{latest_release}/public/assets/specials"
    run "ln -nfs #{shared_path}/public/assets/students #{latest_release}/public/assets/students"
    run "ln -nfs #{shared_path}/public/assets/pages #{latest_release}/public/assets/pages"
  end

  task :start do
    apache.start
  end

  task :stop do
    apache.stop
  end

  task :restart do
    apache.restart
  end
end

after 'deploy:update_code', 'bundler:bundle_new_release'
after 'deploy:update_code', 'deploy:set_database_yml'
after 'deploy:update_code', 'deploy:symlink_files_app'
