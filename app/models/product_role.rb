class ProductRole < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def self.available_product_roles
    %w[manager editor viewer]
  end
end
