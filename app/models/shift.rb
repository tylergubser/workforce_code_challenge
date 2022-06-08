class Shift < ApplicationRecord
    belongs_to :user
    validates :shift_date, presence: true
    validates :start, presence: true
    validates :finish, presence: true
    validates :break_length, presence: true
end
