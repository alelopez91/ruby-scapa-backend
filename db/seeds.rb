# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
  'Naturaleza', 'Números', 'Números con Dados', 'Objetos', 'Personajes', 'Personas', 'Prendas Vestir /Accesorios', 'Pronombres',
  'Religión', 'Señaléctica', 'Sentimientos', 'Situaciones', 'Tiempo', 'Transportes']

categories.each do |category_name|
  Category.find_or_create_by(description: category_name)
end
