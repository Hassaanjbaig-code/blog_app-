class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_create :update_post_likes_counter

  def update_post_likes_counter
    post.update(likescounter: Like.where(post_id: post.id).count)
  end
end
