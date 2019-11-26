ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  FactoryBot.define do
    factory :user do
      email { "test@test.com" }
      first_name { "Hello" }
      last_name { "There" }
      birthday { "04/02/2019" }
      country { "Canada" }
      phone { "5762391745" }
      aboutme { "HELLOOO" }
      password { "123123" }
      role { "owner" }
      admin { false }
    end
  end
  # Add more helper methods to be used by all tests here...
end
