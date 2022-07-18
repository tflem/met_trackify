class Product < ApplicationRecord
  validates :article_number, :article_name,
    :article_location, presence: true
  has_many :product_roles, dependent: :delete_all

  def has_member?(user)
    product_roles.exists?(user_id: user)
  end

  [:manager, :editor, :viewer].each do |role|
    define_method "has_#{role}?" do |user|
      product_roles.exists?(user_id: user, product_role: role)
    end
  end
end
