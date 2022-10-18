class Tweet < ApplicationRecord
    belongs_to :user
    has_many :likes
    has_many :comments

    validates :body, length: {minimum: 5, maximum: 250}, presence: true

    def liked?(user)
        # likes.where(user_id: user.id, tweet_id: tweet.id).exists?
        self.likes.where(user_id: user.id).exists?
    end
end
