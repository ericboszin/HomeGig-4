class Job < ApplicationRecord
    # add the line below when user model has been made
    # has_one :review through :user
    has_many :bids, dependent: :destroy
end
