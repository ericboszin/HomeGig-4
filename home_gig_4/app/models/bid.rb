class Bid < ApplicationRecord
  belongs_to :job
  validates :user_id, presence: true, uniqueness: { scope: :job }
  validates :description, presence: true
  validates :amount, presence: true
  validates :starting_date, presence: true
  validates :duration, presence: true
end
