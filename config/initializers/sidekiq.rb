Sidekiq.configure_server do |config|
  config.redis = {
    host: ENV['REDIS_HOST'],
    port: ENV['REDIS_PORT'] || '6379',
    url: ENV['REDIS_URL'],
    size: 4,
    network_timeout: 5
  }
  schedule_file = 'config/schedule.yml'
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file) if File.exist?(schedule_file) && Sidekiq.server?
end

Sidekiq.configure_client do |config|
  config.redis = {
    host: ENV['REDIS_HOST'],
    port: ENV['REDIS_PORT'] || '6379',
    url: ENV['REDIS_URL'],
    size: 4,
    network_timeout: 5
  }
end
