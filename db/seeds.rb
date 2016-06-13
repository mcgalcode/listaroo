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

list1.child_lists.create(title: "Oregon")
list1.child_lists.create(title: "Duke Hazard")
list1.child_lists.create(title: "Flip-flops")
list1.child_lists.create(title: "Secondary ejaculation")
list1.child_lists.create(title: "Fast")

l1c1 = list1.child_lists.first
l1c1.child_lists.create(title: "Child item 1")
l1c1.child_lists.create(title: "Child item 2")
l1c1.child_lists.create(title: "Child item 3")

list2.child_lists.create(title: "Lone Peak")
list2.child_lists.create(title: "Alta via 1")
list2.child_lists.create(title: "Malcolms butthole")
list2.child_lists.create(title: "Storm Mountain")
list2.child_lists.create(title: "The WURL itself")

list3.child_lists.create(title: "Gregarious")
list3.child_lists.create(title: "Venetian planetoids")
list3.child_lists.create(title: "A small mining rig")
list3.child_lists.create(title: "Overflowing with joy")
list3.child_lists.create(title: "Semen went flying everywhere")
