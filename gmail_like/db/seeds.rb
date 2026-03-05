# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require 'faker'
require 'colorize'

puts "Nettoyage de la base de données...".colorize(:light_blue)
Email.destroy_all

puts "Création de 5 emails de test...".colorize(:light_blue)

5.times do
  Email.create!(
    object: Faker::Lorem.sentence(word_count: 4),
    body: Faker::Lorem.paragraph(sentence_count: 5)
  )
end

puts "Les emails ont été créés avec succès !".colorize(:green)