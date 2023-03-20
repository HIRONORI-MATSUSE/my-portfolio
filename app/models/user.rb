class User < ApplicationRecord
    has_secure_password
    has_many :skills, dependent: :delete_all
    has_many :categories, through: :skills
    has_one_attached :image
    validates :comment, {length: { in: 200..800 }}
end
