# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => Rails.application.credentials.mailgun[:userName],
  :password => Rails.application.credentials.mailgun[:password],
  :domain => Rails.application.credentials.mailgun[:domain],
  :address => 'smtp.mailgun.org',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
