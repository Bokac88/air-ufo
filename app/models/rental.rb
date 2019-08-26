class Rental < ApplicationRecord
  belongs_to :customer, class_name: "User", foreign_key: :customer_id
  belongs_to :ufo
  has_many :reviews
end
