module ApplicationHelper
  MONTHS = %w[enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre]
  def container_begin
    raw "<br/><div class='container'>"
  end

  def container_end
    raw "</div>"
  end

  def header_page(icon, title)
    raw "<div class='row'>
             <div class='col-sm-12 col-md-12 col-lg-12'>
                <h2><em class=\"#{icon}\"></em> &nbsp; #{title}</h2>
                <hr>
             </div>
          </div>"
  end

  def raw_row_col_begin
    raw '<div class="row"><div class="col-sm-12 col-md-12 col-lg-12">'
  end

  def raw_row_col_begin_card
    raw '<div class="row"><div class="col-sm-12 col-md-12 col-lg-12 patrimonial_card">'
  end

  def raw_row_col_end
    raw '</div></div>'
  end

  def can_do(resource, action)
    policy(resource).send(action) || @user&.tipo_usuario == 1
  end

  def can_do_show(resource, action, message)
    message if policy(resource).send(action) || @user&.tipo_usuario == 1
  end

  def back_list_admin(caption, my_route, my_class = '')
    caption = 'Volver a su lista de   administración' if caption.blank?
    link_to caption, my_route, class: my_class
  end

  def small_text(message)
    raw "<span class=\"help-block\"> #{message}</span>"
  end

  def imagen_random
    if Patrimonio.count <= 2
      id = Patrimonio.first.id
    else
      id = rand(Patrimonio.count) + 1
    end

    registro = Patrimonio.find(id)

    if registro.photo.key.nil?
      image_tag "default.jpg", class: "imagen_patrimonio"
    else
      cl_image_tag registro.photo.key, class: "imagen_patrimonio"
    end

  rescue StandardError
    image_tag "default.jpg", class: "imagen_patrimonio"
  end

  def show_avatar(user_id, class_avatar = ' avatar ')
    user = User.find(user_id)
    if user.photo.key.nil?
      raw '<i class="fas fa-user fa-3x avatar-calificaciones"></i>'
    else
      cl_image_tag user.photo.key, class: " avatar "
    end
  end

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

  def ranking_star_show(ranking)
    result = ''
    ranking.times do
      result = "#{result}<em class=\"fas fa-star five-star-color\"></em>"
    end
    ranking = 5 - ranking
    ranking.times do
      result = "#{result}<em class=\"far fa-star five-star-color\"></em>"
    end
    raw result
  end


  def date_to_words(date)
    date_string =   date.to_s
    year = date_string[0, 4]
    month = date_string[5, 2].to_i
    day = date_string[8, 2]
    month = MONTHS[month]
    "#{day} #{month} #{year}"
  end
end
