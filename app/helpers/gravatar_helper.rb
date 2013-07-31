module GravatarHelper
  # TODO: call line 4 straight from the views and remove this method
  def gravatar(user, size)
    user.gravatar size
  end
end
