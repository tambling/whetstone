module GravatarHelper
  def gravatar user
    email_digest = Digest::MD5.hexdigest("#{user.email}")
    "https://secure.gravatar.com/avatar/#{email_digest}?s=80"
  end
end
