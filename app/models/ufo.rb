class Ufo < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  has_many :rentals, foreign_key: :ufo_id
  has_many :reviews, through: :rentals
  
  mount_uploader :photo, PhotoUploader

  include PgSearch::Model
  pg_search_scope :search_by_brand_and_description,
                  against: [:brand, :description],
                  using: {
                    tsearch: { prefix: true }
                  }  
end
