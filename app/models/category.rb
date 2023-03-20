class Category < ApplicationRecord
    has_many :skills, dependent: :delete_all
    has_many :users, through: :skills
end
