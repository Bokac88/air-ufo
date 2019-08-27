class Rental < ApplicationRecord
  belongs_to :customer, class_name: "User", foreign_key: :customer_id
  belongs_to :ufo, dependent: :destroy
  has_many :reviews
end
