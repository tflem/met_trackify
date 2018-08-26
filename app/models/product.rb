class Product < ApplicationRecord
  validates :article_number, presence: true
  validates :article_name, presence: true
  validates :article_location, presence: true
  has_many :product_roles, dependent: :delete_all
end
