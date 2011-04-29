module UsersHelper
  # Get the gravatar image for the specified User
  def gravatar_for(user, options = { :size => 50 })
    gravatar_image_tag(user.email.downcase, :alt => user.name,
                                            :class => 'gravatar',
                                            :gravatar => options)
  end

  # Check if the specifiedd User is the current User
  def current_user?(user)
    user == current_user
  end

end
