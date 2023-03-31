class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :update_the_comment_counter

  private

  def update_the_comment_counter
    post.update(commentscounter: Post.where(id: post.id).count)
  end
end
