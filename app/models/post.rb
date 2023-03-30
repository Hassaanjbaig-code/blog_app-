class Post < ApplicationRecord
    has_many :comments, foreign_key: :post_id
    has_many :likes, foreign_key: :post_id
    belongs_to :author, class_name: 'User'

    def recent_comments
        comments.order(created_at: :desc).limit(5)
    end
    def update_the_post_counter
        author.update(postscounter: author.postscounter + 1)
    end
end