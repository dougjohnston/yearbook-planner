#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

YearbookPlanner::Application.load_tasks

namespace :db do
  desc "Drop, create, migrate then seed the database"
  task :wipe => :environment do
    puts "Dropping the database..."
    Rake::Task['db:drop'].execute
    puts "Creating a new database..."
    Rake::Task['db:create'].execute
    puts "Running migrations..."
    Rake::Task['db:migrate'].execute
    puts "Seeding the database..."
    Rake::Task['db:seed'].execute
    puts "Done."
  end
end
