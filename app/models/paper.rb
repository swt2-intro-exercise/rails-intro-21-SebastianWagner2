class Paper < ApplicationRecord
    validates :title, presence: true
    validates :venue, presence: true
    validates :year, presence: true, format: { with: /[0-9]*/, message: "only allows numbers" }
end
