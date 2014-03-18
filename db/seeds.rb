# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
category_advogado = TemplateCategory.create({name: 'Advogado'})
category_freelancer = TemplateCategory.create({name: 'Freelancer'})
category_manicure = TemplateCategory.create({name: 'Manicure'})
category_advogado.templates.create(name: 'Advogado', path: 'advogado')
Template.create(name: 'Extra', path: 'extra')
category_freelancer.templates.create(name: 'Freelancer', path: 'freela')
Template.create(name: 'Geral', path: 'geral')
category_manicure.templates.create(name: 'Manicure', path: 'manicure')