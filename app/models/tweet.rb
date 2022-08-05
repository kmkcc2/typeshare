class Tweet < ApplicationRecord
    belongs_to :user

    validates :body, length: {minimum: 5, maximum: 250}, presence: true
end
