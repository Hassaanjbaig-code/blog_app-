class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :comments_counter_update

  def comments_counter_update
    Post.update(commentscounter: post.comments.count)
  end
end
