Sham.define do
  username            { Faker::Internet.user_name }
  first_name          { Faker::Name.first_name }
  last_name           { Faker::Name.last_name } 
  password            { (1..10).map { ('a'..'z').to_a.rand }.join }
  email               { Faker::Internet.email }
  title               { Faker::Lorem.words(5).join(' ') }
  body                { Faker::Lorem.words(10).join(' ') }
  tag_name            { Faker::Lorem.words(1).join }
end

Problem.blueprint do
  title         { Sham.title }
  description   { Sham.body }
end

Project.blueprint do
  title         { Sham.title }
  description   { Sham.body }
end

Account.blueprint do
  username                { Sham.username }
  first_name              { Sham.first_name }
  last_name               { Sham.last_name }
  email                   { Sham.email }
  password                { 'testy' }
  password_confirmation   { 'testy' }
  role                    { 'admin' }
end
