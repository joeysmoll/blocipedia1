require 'faker'

#Create Users
10.times do
    user = User.new(
        email: Faker::Internet.email(Faker::Overwatch.unique.hero),
        password: 'password',
        password_confirmation: 'password'
    )
    user.skip_confirmation!
    user.save!
end
users = User.all

#Create Public Wikis
20.times do
    wiki = Wiki.new(
        user: users.sample,
        title: Faker::Pokemon.unique.move + " " + Faker::Food.ingredient,
        body: Faker::VentureBros.unique.quote,
        private: false
    )
    wiki.save!
end

#Create Private Wikis
20.times do
    wiki = Wiki.new(
        user: users.sample,
        title: Faker::Food.ingredient + " " + Faker::Hipster.word,
        body: Faker::FamilyGuy.quote,
        private: true
    )
    wiki.save!
end




puts "Seeds Planted!"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"


