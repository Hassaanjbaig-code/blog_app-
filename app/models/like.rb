class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_the_like_counter
    post.update(likescounter: post.likescounter + 1)
  end
end
