class Category < ApplicationRecord
  has_many :bank_categories, dependent: :destroy
  has_many :banks, through: :bank_categories, dependent: :destroy
  has_many :contents, dependent: :destroy
  
  validates :subject, uniqueness: true
  validates :number, uniqueness: true

end