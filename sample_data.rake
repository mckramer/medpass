require 'faker'

namespace :database do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_sites
    make_divisions
    make_users
    make_allergens
    make_allergies
    make_conditions
    make_procedures
    make_diagnoses
    puts "\n\n=== SUCCESS ===\n\n\n"
  end
end

def make_users
  admin = User.create!(
    :name_first                => "Max",
    :name_last                => "Kramer",
    :email                         => "max@transition.maxkramer.me",
    :password               => "transitionpassword!",
    :password_confirmation  => "transitionpassword!"
  )
  30.times do |n|
    if rand(100).even?
      # make patient
    else
      
    end
    name_first      = Faker::Name.name
    name_last = Faker::Name.name
    email     = "example-#{n+1}@transition.org"
    password  = "password!"
    username  = Faker::Internet.user_name + n.to_s
    bio       = n.odd? ? Faker::Lorem.words(10).join(" ") : nil
    twitter   = rand(100).even? ? Faker::Internet.user_name : nil
    url       = rand(100).odd? ? ("http://" + Faker::Internet.domain_name) : nil
    Author.create!(
      :name                   => name,
      :email                  => email,
      :username               => username,
      :twitter_username       => twitter,
      :bio                    => bio,
      :url                    => url,
      :password               => password,
      :password_confirmation  => password
    )
  end
  puts "\n Users created! \n\n"
end

def make_sites
  site_names = [ "University of North Carolina at Chapel Hill", "Ohio State University", "Duke University", "Texas University at Austin", "Miami University" ]
  site_abbr = [ "UNC", "OSU", "Duke", "UT-Austin", "Miami" ]
  5.times do |n|
    name = site_names[n]
    abbr  = site_abbr[n]
    Institution.create!(
      :name       => name,
      :abbr       => abbr
    )
  end
  puts "\n Sections created! \n\n"
end

def make_divisions
  division_names[] = [ "Oncology", "Pediatric", "Podietry", "Gastro Intestinal", "Kidney" ]
  Institution.all.each do |site|
    5.times do |n|
      name = division_names[n]
      abbr = division_names[n].[0...5]
      site.divisions.create!(
        :name                => name,
        :abbr                  => abbr
      )
    end
  end
  puts "\n Posts created! \n\n"
end

def make_comments
  Author.limit(50).each do |author|
      50.times do
        post    = Post.find_by_id(rand(250) + 1)
        content = Faker::Lorem.sentence(5)
        author.comments.create!(
          :post_id => post.id,
          :content => content
        )
    end
  end
  puts "\n Comments created! \n\n"
end

def make_favorites
  Author.limit(50).each do |author|
    50.times do
      post = Post.find_by_id(rand(250) + 1)
      author.favorite!(post)
    end
  end
  puts "\n Favorites created! \n\n"
end

def make_relationships
  Author.limit(30).each do |author|
    20.times do
      followed = Author.find_by_id(rand(100) + 1)
      author.follow!(followed)
    end
  end
  puts "\n Relationships created! \n\n"
end