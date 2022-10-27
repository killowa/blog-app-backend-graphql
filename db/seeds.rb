# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create([
    {username: 'killow', email: 'killowa@example.com', password: 'Test@123123', role: "admin"},
    {username: 'killola', email: 'killowa@example.com', password: 'Test@123123', role: "guest"}

])