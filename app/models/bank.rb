class Bank < ApplicationRecord
  has_many :bank_categories
  has_many :categories, through: :bank_categories
  # ここまでOK
  has_many :contents

  validates :name, presence: true
  validates :name, uniqueness: true
  # ここもOK
end
