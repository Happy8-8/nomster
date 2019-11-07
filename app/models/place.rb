class Place < ApplicationRecord
belongs_to :user
validates :name, presence: true, length: { minimum: 3, too_short: "is too short (minimum %{count} characters)" }
validates :address, presence: true, length: { in: 17..29 }
validates :description, presence: true, length: { maximum: 47, too_long: "%{count} characters is the maximum allowed" }
end
