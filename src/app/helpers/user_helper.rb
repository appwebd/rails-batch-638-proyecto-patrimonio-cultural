module UserHelper
  def user_mostrar_avatar(user)
    if @user.photo.key.nil?
      image_tag "avatar.png", class:"avatar dropdown-toggle", id: "navbarDropdown", data: { toggle: "dropdown" }, 'aria-haspopup': true, 'aria-expanded': false
    else
      cl_image_tag @user.photo.key, class:"avatar dropdown-toggle", id: "navbarDropdown", data: { toggle: "dropdown" }, 'aria-haspopup': true, 'aria-expanded': false
    end
  end

end