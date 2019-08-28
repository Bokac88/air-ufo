class Ufo < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  has_many :rentals, foreign_key: :ufo_id
  has_many :reviews, through: :rentals
end
