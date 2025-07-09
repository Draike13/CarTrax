namespace :db do
  desc "Forcefully disconnect and drop the development database"
  task force_drop: :environment do
    db = ActiveRecord::Base.connection_db_config.database
    puts "Force dropping: #{db}"
    ActiveRecord::Base.connection.execute <<~SQL
      SELECT pg_terminate_backend(pid)
      FROM pg_stat_activity
      WHERE datname = '#{db}' AND pid <> pg_backend_pid();
    SQL
    Rake::Task["db:drop"].invoke
  end
end
