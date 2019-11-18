class Place < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :photos
    geocoded_by :address
    after_validation :geocode

    validates :name, presence: true, length: { minimum: 3, too_short: "is too short (minimum %{count} characters)" }
    validates :address, presence: true, length: { in: 11..159 }
    validates :description, presence: true, length: { maximum: 371, too_long: "%{count} characters is the maximum allowed" } 
end
