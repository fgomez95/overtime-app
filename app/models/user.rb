class User < ApplicationRecord
  has_many :posts
  validates_presence_of :first_name, :last_name
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
