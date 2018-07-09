module UsersHelper
  def gravatar_for user, options = {size: 80}
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag gravatar_url, alt: user.name, class: "gravatar"
  end

  def find_followed followed_id
    current_user.active_relationships.find_by followed_id: followed_id
  end

  def create_active_relationship
    current_user.active_relationships.build
  end
end
