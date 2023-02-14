class User < ApplicationRecord
    validates :username, :email, presence: true, uniqueness: true, length: {minumum: 3, maximum: 25}
    validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}

    has_many :blogs
end
