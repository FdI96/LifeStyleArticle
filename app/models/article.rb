class Article < ApplicationRecord
  validates :image, presence: true
  validates :title, presence: true
  validates :text, presence: true
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_and_belongs_to_many :categories, class_name: 'Category'
  has_many :votes, dependent: :destroy
  has_one_attached :image
end
