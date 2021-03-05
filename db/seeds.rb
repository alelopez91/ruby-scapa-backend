AdminUser.find_or_create_by(email: 'admin@scapa.com.ar') do |user|
  user.password = 'asdqwe123'
  user.password_confirmation = 'asdqwe123'
end

User.find_or_create_by(email: 'user@scapa.com.ar') do |user|
  user.password = 'asdqwe123'
  user.password_confirmation = 'asdqwe123'
end

categories = [ 'Abecedario', 'Acciones', 'Acontecimientos', 'Adjetivos', 'Adverbios', 'Alimentación', 'Animales', 'Aragón',
  'Casa', 'Colegio', 'Colores', 'Conceptos', 'Conjunciones', 'Cuerpo', 'Discapacidad', 'Entorno', 'Fórmulas cortesía', 'Formas',
  'Herramientas', 'Instrumentos', 'Interjecciones', 'Juegos', 'Juguetes', 'Lugares', 'Materiales', 'Medios de Comunicación',
  'Naturaleza', 'Números', 'Números con Dados', 'Objetos', 'Personajes', 'Personas', 'Prendas Vestir-Accesorios', 'Pronombres',
  'Religión', 'Señaléctica', 'Sentimientos', 'Situaciones', 'Tiempo', 'Transportes']

categories.each do |category_name|
  category = Category.find_or_create_by(description: category_name)

  file_paths = Dir.glob("./public/pictograms/#{category.description}/*")

  file_paths.each do |file_path|
    filename = File.basename(file_path)
    description = filename.gsub('.png', '').capitalize

    next if Pictogram.exists?(description: description)
    encoded_image = Base64.strict_encode64(File.read(file_path))

    Pictogram.create(
      description: description,
      classifiable: category,
      is_custom: false,
      image: {
        data: "data:image/png;base64,#{encoded_image}",
        filename: filename
      }
    )
  end
end
