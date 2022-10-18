class Tweet < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy

    validates :body, length: {minimum: 5, maximum: 250}, presence: true

    def liked?(user)
        # likes.where(user_id: user.id, tweet_id: tweet.id).exists?
        self.likes.where(user_id: user.id).exists?
    end
end
