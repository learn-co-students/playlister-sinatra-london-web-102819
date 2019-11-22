# Add seed data here. Seed your database with `rake db:seed`

10.times do
    Song.create(name: Faker::Music::Phish.unique.song)
    Artist.create(name:Faker::Music.unique.band)
    Genre.create(name:Faker::Music.unique.genre)
end