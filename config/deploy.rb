# �� ��������� ��� ����������� �������� ������������ Bundler.
# ��� ������ �������� �������������� ���������� � ���������
# ����������� gems, ��������� � ����� Gemfile.
#
## !!! �� �������� ��������
# gem 'capistrano'
# gem 'unicorn'
#
# � ��� Gemfile.
#
# ���� �� ����������� ������ ������� ���������� �������������,
# ��������������� ��� ������.
require 'bundler/capistrano'

## ����� �� ������� database.yml � ������� �������� ������, ���������
## dayabase.yml � shared-������� ������� �� ������� � ����������������
## ��������� ������.

# after "deploy:update_code", :copy_database_config
# task :copy_database_config, roles => :app do
#   db_config = "#{shared_path}/database.yml"
#   run "cp #{db_config} #{release_path}/config/database.yml"
# end

# � rails 3 �� ��������� �������� ������� assets pipelining,
# ������� ��������� ����������� ��������� ������ �����������
# ������ css � js.
# ��� ������ ������������� ��������� ������� ����������
# ������ ������ ������� ��� ������.
# ���� �� �� ����������� assets pipelining � ����� �������,
# ��� � ��� ������ ������ rails, ��������������� ��� ������.
load 'deploy/assets'

# ��� �������� ������ �� ����������� ��� ��������� �����������
# SSH �� �����. ��� ������ capistrano ����� ��������������
# ssh-agent, ������� ������������� ����������� ������������
# ����������� �� ������ �����.
# ���� �� �� ����������� ����������� SSH �� ������ � ssh-agent,
# ��������������� ��� �����.
#ssh_options[:forward_agent] = true

# ��� ������ ������� � ������ ����������.
# �� ������� ��� �������� ��� �������������, ��� ������������ ������.
set :application,     "ourresource"

# ������ ���������� �������.
set :deploy_server,   "fluorine.locum.ru"

# �� �������� � �������� �������������� ����������� � ������ ������������.
set :bundle_without,  [:development, :test]

set :user,            "hosting_ourresource"
set :login,           "ourresource"
set :use_sudo,        false
set :deploy_to,       "/home/#{user}/projects/#{application}"
set :unicorn_conf,    "/etc/unicorn/#{application}.#{login}.rb"
set :unicorn_pid,     "/var/run/unicorn/#{application}.#{login}.pid"
set :bundle_dir,      File.join(fetch(:shared_path), 'gems')
role :web,            deploy_server
role :app,            deploy_server
role :db,             deploy_server, :primary => true


# ��������� ������ ����������, �.�. ��� ������ ���������� rvm.
set :rvm_ruby_string, "1.9.3"
set :rake,            "rvm use #{rvm_ruby_string} do bundle exec rake" 
set :bundle_cmd,      "rvm use #{rvm_ruby_string} do bundle"


# ��������� ������� �������� ������ � �����������,
# �� ��������� - git, ���� ������������ ���� ������� ������,
# ����� �������� �������� scm.
set :scm,             :git

# ��������������, ��� �� ���������� ����������� Git � �����
# �������� �������� � ����������� git/<��� �������>.git.
# ��������� � �������� ����������� ������� � ����� �����
# http://locum.ru/blog/hosting/git-on-locum
#set :repository,      "ssh://#{user}@#{deploy_server}/home/#{user}/git/#{application}.git"

## ���� ��� ����������� � GitHub, ����������� ����� ������������
set :repository,    "git@github.com:grant88/ourresource.git"

## --- ���� ����� ����� ������ ������ ������ ����� �� ����� ---

before 'deploy:finalize_update', 'set_current_release'
task :set_current_release, :roles => :app do
    set :current_release, latest_release
end


  set :unicorn_start_cmd, "(cd #{deploy_to}/current; rvm use #{rvm_ruby_string} do bundle exec unicorn_rails -Dc #{unicorn_conf})"



# - for unicorn - #
namespace :deploy do
  desc "Start application"
  task :start, :roles => :app do
    run unicorn_start_cmd
  end

  desc "Stop application"
  task :stop, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -QUIT `cat #{unicorn_pid}`"
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -USR2 `cat #{unicorn_pid}` || #{unicorn_start_cmd}"
  end
end