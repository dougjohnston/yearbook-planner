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

  task :wipe_without_seed => :environment do
    puts "Dropping the database..."
    Rake::Task['db:drop'].execute
    
    puts "Creating a new database..."
    Rake::Task['db:create'].execute

    puts "Running migrations..."
    Rake::Task['db:migrate'].execute

    puts "Done."
  end


  desc "Wipe the development and test databases"
  namespace :wipe do
    task :all => :environment do
      puts "Wiping the development database..."
      Rake::Task['db:wipe'].execute

      puts "Wiping the test database..."
      Rails.env = "test"
      system("rake db:wipe_without_seed RAILS_ENV=test")
    end
  end
end
