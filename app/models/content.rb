class Content < ApplicationRecord
  belongs_to :bank
  belongs_to :category
  belongs_to :user

  validates :detail, presence: true
  validates :bank_id, presence: true
  validates :category_id, presence: true
  validates :user_id, presence: true
end
