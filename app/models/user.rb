class User < ApplicationRecord
  has_many :posts
  validates_presence_of :first_name, :last_name, :phone_number
  validates :phone_number, length: { is: 8 }
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  
  PHONE_REGEX = /\A[0-9]*\Z/
  validates_format_of :phone_number, with: PHONE_REGEX
  
  def full_name
    "#{last_name}, #{first_name}"
  end
end
