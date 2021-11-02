class Beer < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :name, :description, :category, :price, :quantity, presence:true

  include PgSearch::Model
  pg_search_scope :search_beers,
                  against: %i[name category description],
                  using: {
                    tsearch: { prefix: true }
                  }
end
