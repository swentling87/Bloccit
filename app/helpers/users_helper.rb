module UsersHelper
  def detect_post_activity(user)
    if user.posts.count == 0
      "#{user.name} has not submitted any posts yet."
    else
      render @user.posts
    end
  end

  def detect_comment_activity(user)
    if user.comments.count == 0
      "#{user.name} has not submitted any comments yet."
    else
      render @user.comments
    end
  end

end
