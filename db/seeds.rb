# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.delete_all
Site.delete_all
Template.delete_all
TemplateCategory.delete_all

Admin.create({email: 'admin@winmoon.com', password: 'winmoonstar', password_confirmation: 'winmoonstar'})
category_advogado = TemplateCategory.create({name: 'Advogado'})
category_corretor = TemplateCategory.create({name: 'Corretor'})
category_freelancer = TemplateCategory.create({name: 'Freelancer'})
category_manicure = TemplateCategory.create({name: 'Manicure'})
advogado = category_advogado.templates.create(name: 'Advogado', path: 'advogado', pages: 'index,sobrenos,servicos,contatos')
corretor = category_corretor.templates.create(name: 'Corretor', path: 'corretor', pages: 'index,sobrenos,imoveis,contatos')
extra = Template.create(name: 'Extra', path: 'extra', pages: 'index,sobrenos,servicos,contatos')
freela = category_freelancer.templates.create(name: 'Freelancer', path: 'freela', pages: 'index,sobremim,portifolio,contatos')
geral = Template.create(name: 'Geral', path: 'geral', pages: 'index')
manicure = category_manicure.templates.create(name: 'Manicure', path: 'manicure', pages: 'index,sobrenos,servicos,contatos')
