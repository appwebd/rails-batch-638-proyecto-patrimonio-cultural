module PatrimonioHelper
  def imagen_mostrar(imagen)
    if imagen.nil?
      image_tag "patrimonio.png", class: "imagen_patrimonio"
    else
      cl_image_tag imagen, class: "imagen_patrimonio"
    end
  rescue StandardError
    image_tag "patrimonio.png", class: "imagen_patrimonio"
  end
end
