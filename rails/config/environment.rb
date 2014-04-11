RAILS_GEM_VERSION = '2.3.8' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.frameworks -= [ :active_resource ]
  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer
  config.time_zone = 'UTC'
  config.action_mailer.default_content_type = "text/plain"
  config.action_mailer.delivery_method = :sendmail
  config.action_mailer.sendmail_settings = { :location  => "/usr/sbin/sendmail", :arguments => "-i -t" }
end