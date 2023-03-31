class Post < ApplicationRecord
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id
  belongs_to :author, class_name: 'User'
  after_create :update_post_counter

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_post_counter
    author.update(postscounter: author.postscounter + 1)
  end
end
