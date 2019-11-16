class Place < ApplicationRecord
    belongs_to :user
    has_many :comments
    geocoded_by :address
    after_validation :geocode

    validates :name, presence: true, length: { minimum: 3, too_short: "is too short (minimum %{count} characters)" }
    validates :address, presence: true, length: { in: 11..59 }
    validates :description, presence: true, length: { maximum: 97, too_long: "%{count} characters is the maximum allowed" } 
end
