class Beer < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :name, :description, :category, :price, :quantity, presence:true
end
