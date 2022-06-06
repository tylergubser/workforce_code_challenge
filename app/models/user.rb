class User < ApplicationRecord
    has_secure_password
    belongs_to :organisation
    has_many :shifts
    validates :email_address, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true
end
