require "capistrano/setup"
require 'capistrano/rbenv'
require "capistrano/deploy"
require "capistrano/scm/git"
require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require 'capistrano3/unicorn'
require 'capistrano/console'
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
