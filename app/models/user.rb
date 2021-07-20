class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username, presence: true, uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  has_many :votes, dependent: :destroy
  has_many :articles, dependent: :destroy
end
