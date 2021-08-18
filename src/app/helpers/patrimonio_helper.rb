module PatrimonioHelper
  def imagen_mostrar(imagen)
    if imagen.nil?
      image_tag "patrimonio.png"
    else
      cl_image_tag imagen
    end
  rescue StandardError
    image_tag "patrimonio.png"
  end
end
