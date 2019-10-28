class Review < ApplicationRecord
    # belongs_to :job
    validates :text, presence: true
    validates :rating, presence: true, numericality: { only_integer: true, greater_than: -1, less_than: 11 }
end
