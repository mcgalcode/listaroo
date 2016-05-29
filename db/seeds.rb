# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

lists = List.create([ { title: "Faggots" }, { title: "Hikes" }, { title: "Poopymeatsocks" }])

list1 = List.find(1)
list2 = List.find(2)
list3 = List.find(3)

list1.list_items.create(content: "Oregon")
list1.list_items.create(content: "Duke Hazard")
list1.list_items.create(content: "Flip-flops")
list1.list_items.create(content: "Secondary ejaculation")
list1.list_items.create(content: "Fast")

list2.list_items.create(content: "Lone Peak")
list2.list_items.create(content: "Alta via 1")
list2.list_items.create(content: "Malcolms butthole")
list2.list_items.create(content: "Storm Mountain")
list2.list_items.create(content: "The WURL itself")

list3.list_items.create(content: "Gregarious")
list3.list_items.create(content: "Venetian planetoids")
list3.list_items.create(content: "A small mining rig")
list3.list_items.create(content: "Overflowing with joy")
list3.list_items.create(content: "Semen went flying everywhere")
