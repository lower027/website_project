class Profile < ApplicationRecord
    belongs_to :user

    has_one_attached :avatar, dependent: :destroy

    has_many :profile_interests, dependent: :destroy
    has_many :interests, through: :profile_interests

    validates :mini_bio, length: {maximum: 500}

    
end

