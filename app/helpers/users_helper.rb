module UsersHelper
  def full_name
    "#{firstname} #{lastname}"
  end

  def load_comment_review review
    review.comments.load_comment
  end

  def current_user? user
    current_user == user
  end

  def load_reply_comment reply_id
    Comment.load_reply_comment reply_id
  end

  def check_liked review
    review.likes.liked(current_user.id, review.id)
  end
end
