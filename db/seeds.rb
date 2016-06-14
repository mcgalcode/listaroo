# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


clayton = User.create([ {username: "clayton", password: "@@pw@@", password_confirmation: "@@pw@@"}])
max = User.create([ {username: "max", password: "@@pw@@", password_confirmation: "@@pw@@"}])
malcolm = User.create([ {username: "malcolm", password: "@@pw@@", password_confirmation: "@@pw@@"}])
derek = User.create([ {username: "derek", password: "@@pw@@", password_confirmation: "@@pw@@"}])
kyle = User.create([ {username: "kyle", password: "@@pw@@", password_confirmation: "@@pw@@"}])

listarooDev = User.find_by(username: "max").created_teams.create(name: "Listaroo Devteam")
hikePlan = User.find_by(username: "clayton").created_teams.create(name: "Hike planning team")
forksTeam = User.find_by(username: "malcolm").created_teams.create(name: "Forks and Knives team")

listarooDev.invited_users << [clayton, malcolm, derek, kyle]
hikePlan.invited_users << [max, malcolm, derek, kyle]
forksTeam.invited_users << [clayton, max, derek, kyle]

authItems = listarooDev.lists.create(title: "Auth items")
token = authItems.child_lists.create(title: "token stuff")
username = authItems.child_lists.create(title: "user name submission")
password = authItems.child_lists.create(title: "password submission")

uiItems = listarooDev.lists.create(title: "UI Changes")
uiItems.child_lists.create(title: "use bootstrap")
uiItems.child_lists.create(title: "load both team/list components at once")
uiItems.child_lists.create(title: "use bootstrap")

wasatch = hikePlan.lists.create(title: "wasatch area")
wasatch.child_lists.create(title: "broad forks twin peaks")
wasatch.child_lists.create(title: "mt nebo")
wasatch.child_lists.create(title: "lone peak")

europe = hikePlan.lists.create(title: "european hikes")
europe.child_lists.create(title: "alta via 1")
europe.child_lists.create(title: "the haute route")
europe.child_lists.create(title: "the road to gimmelwald")

knives = forksTeam.lists.create(title: "knife types")
knives.child_lists.create(title: "butchers knife")
knives.child_lists.create(title: "butter knife")
knives.child_lists.create(title: "steak knife")

forks = forksTeam.lists.create(title: "fork types")
forks.child_lists.create(title: "trident of poseidon")
forks.child_lists.create(title: "salad fork")
forks.child_lists.create(title: "small pitchfork")
