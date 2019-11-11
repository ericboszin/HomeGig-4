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
		true
	end

    # Assuming country_select is used with User attribute `country_code`
  # This will attempt to translate the country name and use the default
  # (usually English) name if no translation is available
  def country_name
    countryfull = ISO3166::Country[country]
    countryfull.translations[I18n.locale.to_s] || countryfull.name
  end
end
