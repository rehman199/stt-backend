Sidekiq.configure_server do |config|
	config.redis = { url: ENV['REDIS_URL'] || 'redis://localhost:6379/0' }
	config.average_scheduled_poll_interval = 1
	config.logger.level = Logger::DEBUG
end
  
Sidekiq.configure_client do |config|
	config.redis = { url: ENV['REDIS_URL'] || 'redis://localhost:6379/0' }
	config.average_scheduled_poll_interval = 1
	config.logger.level = Logger::DEBUG
end
