class BankCategory < ApplicationRecord
  belongs_to :bank
  belongs_to :category
end