class Shift < ApplicationRecord
    belongs_to :user

    validates :start, presence: true
    validates :finish, presence: true
    validates :break_length, presence: true
end
