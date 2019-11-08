class User < ApplicationRecord
  enum role: [:admin, :owner, :worker]
  has_many :jobs, dependent: :destroy
  has_many :bids, through: :jobs
  has_many :reviews, through: :jobs
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	protected def confirmation_required?	
		false
	end
end
