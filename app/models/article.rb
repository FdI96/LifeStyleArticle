class Article < ApplicationRecord
  validates :image, presence: true
  validates :title, presence: true
  validates :text, presence: true
  validates_length_of :title, minimum: 3, maximum: 10, allow_blank: true
  validates_length_of :foo, minimum: 1, maximum: 120, allow_blank: true
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :categories, class_name: 'Category'
  has_many :votes, dependent: :destroy
  has_one_attached :image
end
