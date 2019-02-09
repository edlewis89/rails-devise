class Advertisement < ApplicationRecord
  has_many :products, dependent: :destroy

  has_many :user_ads
  has_many :users, through: :user_ads

  has_one :service, dependent: :destroy

  has_paper_trail
end
