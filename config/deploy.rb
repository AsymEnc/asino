# TODO:
# - manage .rvmrc on the remote server;
# - manage the database configuraton file.

# Capistrano task for Bundler.
require 'bundler/capistrano'

set :application, 'asino'
set :user, 'arbox'

ssh_options[:auth_methods] = ['publickey']

set :repository,  './'
set :scm, :none

server 'ldvpc14.uni-trier.de', :app, :web, :db, :primary => true

# Do not use _sudo_ on the remote machine.
set :use_sudo, false

# Path to the directory on the _remote_ machine.
set :deploy_to, "/var/www/apps/#{application}"
set :deploy_via, :copy

set :copy_dir, '../tmp/capistrano'
set :copy_remote_dir, "#{deploy_to}/tmp/capistrano"


# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :remote do

  desc <<-DESC
    Create directory required by copy_remote_dir.
  DESC
  task :create_copy_remote_dir, :roles => :app do
    print "    creating #{copy_remote_dir}.\n"
    run "mkdir -p #{copy_remote_dir}"
  end

end

# Custom tasks for our local machine.
namespace :local do
  
  desc <<-DESC
    Create directory required by copy_dir.
  DESC
  task :create_copy_dir do
    print "    creating #{copy_dir}.\n"
    system "mkdir -p #{copy_dir}"
  end

  desc <<-DESC
    Copy Solr and DB files to the remote server.
  DESC
  task :copy_precomputed do
    system "scp -r db/production.sqlite3  ldvpc14:/var/www/apps/asino/shared/db"
    system "scp -r solr/default/* ldvpc14:/var/www/apps/asino/shared/solr/default"
  end
end

# Callbacks.
before 'deploy:setup', 'local:create_copy_dir', 'remote:create_copy_remote_dir'


after 'deploy:update_code' do
#  run "cd #{release_path} && ln -nfs #{shared_path}/db/production.sqlite3 #{release_path}/db/production.sqlite3"
#  run "cd #{release_path} && ln -nfs #{shared_path}/solr/default #{release_path}/solr/default"
end
