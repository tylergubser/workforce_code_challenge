class User < ApplicationRecord
    has_secure_password
    belongs_to :organisation, optional: true
    has_many :shifts, dependent: :destroy
    validates :email_address, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true
    validates :name, presence: true
    validates :password, presence: true, 
    :confirmation => true,
    :length => {:within => 6..40}

    

    
end
