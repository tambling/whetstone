# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

# puts 'ROLES'
# YAML.load(ENV['ROLES']).each do |role|
#   Role.find_or_create_by_name({ :name => role }, :without_protection => true)
#   puts 'role: ' << role
# end
# puts 'DEFAULT USERS'
# user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
# puts 'user: ' << user.name
# user.add_role :admin


User.destroy_all
Stone.destroy_all
Resource.destroy_all
Discussion.destroy_all
Comment.destroy_all

user = User.create(name: "Hussain Tambawala", email: "hussain283@gmail.com", password: "password")
user = User.create(name: "Bryce Archer", email: "bryce.charles.archer@gmail.com", password: "ihearthussain")

stone = FactoryGirl.create(:stone)
user.stones << stone

5.times {
  stone.resources << FactoryGirl.create(:resource)

  discussion = FactoryGirl.create(:discussion)
  stone.discussions << discussion
  user.discussions << discussion
}

stone.discussions.each do |discussion|
  5.times do
    comment = FactoryGirl.create(:comment)
    discussion.comments << comment
    user.comments << comment
  end
end
