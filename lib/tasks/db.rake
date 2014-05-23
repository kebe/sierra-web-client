desc "Migrate the database through scripts in db/migrate."
Rake::Task["db:migrate"].clear
namespace :db do
  task :migrate do
    Rake::Task["db:migrate_db"].invoke
  end

  task :migrate_db => :environment  do
    ActiveRecord::Base.establish_connection "write_#{Rails.env}"
    ActiveRecord::Migrator.migrate("db/migrate/write")
  end

end