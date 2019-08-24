Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://127.0.0.1:6379/10' } #标准格式 config.redis = { url: "redis://#{redis_server}:#{redis_port}/#{redis_db_num}", namespace: redis_namespace }
end
Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://127.0.0.1:6379/10' } #标准格式 config.redis = { url: "redis://#{redis_server}:#{redis_port}/#{redis_db_num}", namespace: redis_namespace }
end

#require 'sidekiq/api'
#Sidekiq::ScheduledSet.new.select {|job| job['wrapped'] == CheckreceiptJob.name}.each(&:delete)
#Sidekiq::Queue.new("Checkreceipt")
#CheckreceiptJob.set(wait: 1.minute).perform_later
