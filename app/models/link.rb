require "securerandom"

class Link < ApplicationRecord
    
    validates :shortened, presence: true, uniqueness: true
    validates :original, presence: true
    
    default_scope { order(created_at: :desc) }
    
    def self.new_shortened_url
        SecureRandom.hex(3)
    end
end
