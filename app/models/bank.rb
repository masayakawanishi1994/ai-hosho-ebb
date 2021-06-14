class Bank < ApplicationRecord
  has_many :bank_categories, dependent: :destroy
  has_many :categories, through: :bank_categories, dependent: :destroy
  has_many :contents, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
end
