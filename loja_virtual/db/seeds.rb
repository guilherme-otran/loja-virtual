# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# admin = User.create("test@admin.com.br","root")
# admin.update_atribute(:admin,true)

admin = User.create({name: "root", email: "test@admin.com.br", admin: true})

Category.create({name: "Masculino"})
Category.create({name: "Feminino"})
Category.create({name: "Infantil"})