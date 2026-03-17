# Mark existing migrations as safe
StrongMigrations.start_after = 20260317104448

# Set timeouts for migrations
StrongMigrations.lock_timeout = 10.seconds
StrongMigrations.statement_timeout = 1.hour

# Analyze tables after indexes are added (not supported on SQLite)
StrongMigrations.auto_analyze = !ActiveRecord::Base.connection_db_config.adapter.include?("sqlite")

# Set the version of the production database
# so the right checks are run in development
# StrongMigrations.target_version = 10

# Add custom checks
# StrongMigrations.add_check do |method, args|
#   if method == :add_index && args[0].to_s == "users"
#     stop! "No more indexes on the users table"
#   end
# end
