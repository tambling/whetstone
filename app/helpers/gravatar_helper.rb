module GravatarHelper
  def gravatar(user, size)
    email_digest = Digest::MD5.hexdigest("#{user.email}")
    "https://secure.gravatar.com/avatar/#{email_digest}?s=#{size}"
  end
end
