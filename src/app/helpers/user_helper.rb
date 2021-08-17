module UserHelper
  def user_show_avatar(class_avatar = 'avatar')
    if @user.photo.key.nil?
      image_tag "avatar.png", class: "#{class_avatar} dropdown-toggle",
                              id: "navbarDropdown", data: { toggle: "dropdown" },
                              'aria-haspopup': true, 'aria-expanded': false
    else
      cl_image_tag @user.photo.key, class: "avatar dropdown-toggle",
                                    id: "navbarDropdown", data: { toggle: "dropdown" },
                                    'aria-haspopup': true, 'aria-expanded': false
    end
  rescue StandardError
    image_tag "avatar.png", class: "#{class_avatar} dropdown-toggle",
                            id: "navbarDropdown", data: { toggle: "dropdown" },
                            'aria-haspopup': true, 'aria-expanded': false
  end
end
