class Category < ApplicationRecord
  has_many :bank_categories
  has_many :banks, through: :bank_categories
  has_many :contents
  
  validates :subject, uniqueness: true
  validates :number, uniqueness: true

end