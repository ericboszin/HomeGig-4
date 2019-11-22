# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!


ActionMailer::Base.smtp_settings = {
  :port           => 587,
  :address        => 'smtp.sendgrid.net',
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
  :domain         => 'home-gig-4.herokuapp.com',
  :authentication => :plain,
  :enable_starttls_auto => true
}
ActionMailer::Base.delivery_method = :smtp



#ActionMailer::Base.smtp_settings = {
 #:user_name => Rails.application.credentials.mailgun[:userName],
 #:password => Rails.application.credentials.mailgun[:password],
 #:domain => Rails.application.credentials.mailgun[:domain],
 #:address => 'smtp.sendgrid.org',
 #:port => 587,
 #:authentication => :plain,
 #:enable_starttls_auto => true
#}
