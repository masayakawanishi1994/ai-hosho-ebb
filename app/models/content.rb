class Content < ApplicationRecord
  belongs_to :bank
  belongs_to :category
  belongs_to :user

  validates :detail, presence: true
end
