class Post < ApplicationRecord
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id
  belongs_to :author, class_name: 'User'
    validates :title, presence: true, lenght: { maximum: 250 }
    validates :commentscounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :likescounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  after_create :update_post_counter

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_post_counter
    author.update(postscounter: author.postscounter + 1)
  end
end
