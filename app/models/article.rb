class Article < ApplicationRecord
  validates :image, presence: true
  validates :title, presence: true
  validates :text, presence: true
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :categories
  has_many :votes, dependent: :destroy
  has_one_attached :image
end
