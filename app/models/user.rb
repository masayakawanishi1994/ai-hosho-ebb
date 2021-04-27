class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :contents
  
  validates :name, presence: true
  validates :email, presence: true
  validates :authentication_key, numericality: { only_integer: true,equal_to: 6155, message: 'が正しくありません'}

  
end