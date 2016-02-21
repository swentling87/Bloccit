class FavoriteMailer < ApplicationMailer
  default from: "swentling87@gmail.com"

  def new_comment(user, post, comment)
    headers["Message-ID"] = "<comments/#{comment.id}@immense-plains-18841.herokuapp.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@immense-plains-18841.herokuapp.com>"
    headers["References"] = "<post/#{post.id}@immense-plains-18841.herokuapp.com>"

     @user = user
     @post = post
     @comment = comment

     mail(to: user.email, subject: "New comment on #{post.title}")
   end
end
