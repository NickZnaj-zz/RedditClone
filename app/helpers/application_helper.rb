module ApplicationHelper

  def post_author(post)
    User.find(post.author_id).username
  end
end
