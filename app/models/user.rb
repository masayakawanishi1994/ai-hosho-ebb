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

# class Content < ApplicationRecord
#   belongs_to :bank
#   belongs_to :category
#   belongs_to :user

#   validates :detail, presence: true
#   validates :bank_id, presence: true
#   validates :category_id, presence: true
#   validates :user_id, presence: true
# end
