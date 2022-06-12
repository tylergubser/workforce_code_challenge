class Organisation < ApplicationRecord
    has_many :users
    has_many :shifts, through: :users, dependent: :destroy
    validates :name, presence: true
    validates :hourly_rate, presence: true
end
