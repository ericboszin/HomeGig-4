class User < ApplicationRecord
  enum role: [:admin, :owner, :worker]
  has_many :jobs, dependent: :destroy
  has_many :bids, through: :jobs
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
