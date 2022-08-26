class User < ApplicationRecord
    has_secure_password
    mount_uploader :photo, PhotoUploader

    has_many :events_join
has_many :events, through: :events_join
    validates :name, presence: true, uniqueness: true
end