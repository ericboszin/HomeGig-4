class Job < ApplicationRecord
    # add the line below when user model has been made
    # has_one :review through :user
    has_many :bids, dependent: :destroy
    has_many :reviews, dependent: :destroy
    belongs_to :user
    enum status: { available: "available", started: "started", cancelled: "cancelled", completed: "completed" }
    validates :status, presence: true
end
