class Post < ApplicationRecord
  belongs_to :user

  def self.posts_scope(user)
    return Post.all if user.admin?
    return user.posts
  end
end
