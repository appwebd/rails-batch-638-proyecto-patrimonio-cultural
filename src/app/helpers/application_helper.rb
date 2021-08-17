module ApplicationHelper
  def container_begin
    raw "<br/><div class='container'>"
  end

  def container_end
    raw "</div>"
  end

  def header_page(icon, title)
    raw "<div class='row'>
             <div class='col'>
                <h2><em class=\"#{icon}\"></em> &nbsp; #{title}</h2>
                <hr>
             </div>
          </div>"
  end

  def raw_row_col_begin
    raw '<div class="row"><div class="col">'
  end

  def raw_row_col_begin_card
    raw '<div class="row"><div class="col patrimonial_card">'
  end

  def raw_row_col_end
    raw '</div></div>'
  end

  def can_do(resource, action)
    policy(resource).send(action)
  end

  def can_do_show(resource, action, message)
    message if policy(resource).send(action)
  end

  def back_list_admin(caption, my_route, my_class = '')
    caption = 'Volver a su lista de   administración' if caption.blank?
    link_to caption, my_route, class: my_class
  end

  def small_text(message)
    raw "<span class=\"help-block\"> #{message}</span>"
  end
end
