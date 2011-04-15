require 'faker'

namespace :database do
  desc "Fill database with sample data"
  task :populate => :environment do
    #Rake::Task['db:reset'].invoke
    make_sites
    make_divisions
    make_users
    make_allergens
    make_allergies
    make_conditions
    make_procedures
    make_diagnoses
    make_drugs
    make_indications
    make_dosages
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
      #make provider
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
  names = [ "University of North Carolina at Chapel Hill", "Ohio State University", "Duke University", "Texas University at Austin", "Miami University" ]
  abbrs = [ "UNC", "OSU", "Duke", "UT-Austin", "Miami" ]
  (names.length).times do |n|
    name = site_names[n]
    abbr  = site_abbr[n]
    Institution.create!(
      :name       => name,
      :abbr       => abbr
    )
  end
  puts "\n Institutions created! \n\n"
end

def make_divisions
  names = [ "Oncology", "Pediatric", "Podietry", "Gastro Intestinal", "Kidney" ]
  Institution.all.each do |site|
    (names.length).times do |n|
      name = names[n]
      abbr = names[n]
      site.divisions.create!(
        :name                => name,
        :abbr                  => abbr
      )
    end
  end
  puts "\n Divisions created! \n\n"
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

def make_allergens
  names = [ "Peanuts", "Tree nuts", "Soy", "Water", "Wheat", "Shellfish", "Latex", "Milk", "Eggs", "MSG" ]
  (names.length).times do |n|
    name = names[n]
    description = Faker::Lorem.sentences
    Allergen.create!(
      :name       => name,
      :abbr       => name,
      :description => description
    )
  end
  puts "\n Allergens created! \n\n"
end

def make_drugs
  @drugs = ['Albuterol', 'Alendronate', 'Amitriptyline', 'Amoxicillin', 'Atenolol', 'Baclofen', 'Benazepril', 'Bumetanide', 'Buspirone', 'Cephalexin', 'Chlorpropamide', 'Cimetidine', 'Ciprofloxacin', 'Citalopram', 'Clonidine', 'Cyclobenzaprine', 'Dexamethasone', 'Diclofenac', 'Dicyclomine', 'Diltiazem', 'Doxazosin', 'Doxepin Hcl', 'Doxycycline Hyclate', 'Enalapril', 'Estradiol', 'Estropipate', 'Famotidine', 'Fluocinonide', 'Fluoxetine', 'Folic Acid', 'Furosemide', 'Gentamicin', 'Glimepiride', 'Glipizide', 'Glyburide', 'Haloperidol', 'Hydralazine', 'Hydrochlorothiazide', 'Hydrocortisone', 'Ibuprofen', 'Indapamide', 'Isoniazid', 'Lactulose', 'Levothyroxine', 'Loratadine', 'Lovastatin', 'Magnesium Oxide', 'Medroxyprogesterone', 'Megestrol', 'Meloxicam', 'Metformin', 'Methyldopa', 'Methylprednisolone', 'Naproxen', 'Nortriptyline', 'Nystatin', 'Oxybutynin', 'Penicillin', 'Phenazopyridine', 'Pilocarpine', 'Potassium Chloride', 'Pravastatin', 'Prednisone', 'Prochlorperazine', 'Promethazine', 'Ranitidine', 'Spironolactone']
  50.times do |n|
    name              = @drugs[n]
    description    = Faker::Lorem.sentences
    Drug.create!(
      :name => name,
      :description => description
    )
  end
  Drug.limit(10).each do |drug, n|
    parent = Drug.find_by_id(n + 15)
    drug.update
  end
  puts "\n Drugs created! \n\n"
end

def make_indications
  # should complete "drug is used to ___", such as drug is used to lower blood pressure
  verbs = ['lower', 'raise', 'strengthen', 'weaken', 'improve', 'protect', 'reduce', 'relieve']
  nouns = ['blood pressure', 'cholesterol', 'the immune system', 'the number of white blood cells', 'minor aches and pains', 'minor inflammation', 'minor fever']
  Drug.all.each do |drug|
    rand(1..3).times do
      text = verbs[rand(verbs.length)] + ' ' + nouns[rand(nouns.length)]
      Drug.indications.create!(
        :text => text
        :description => Faker::Lorem.sentences
      )
    end
  end
  puts "\n Indications created! \n\n"
end

def make_dosages
  units = ['mg', 'mL']
  frequencies = [0, 6, 8, 12, 24, 56, 84, 168]
  forms = ['tablet', 'capsule', 'liquid', 'gel', 'cream']
  routes = ['oral', 'nasal', 'Intraveneous (IV)', 'Intramusculer (IM)', 'topical']
  Drug.all.each do |drug|
    rand(1..3).times do
      unit = units[rand(units.length)])
      strength = rand(10..300)
      dose = rand(1..3) * strength
      frequency = frequencies[rand(frequencies.length)]
      form = forms[rand(forms.length)]
      route = routes[rand(routes.length)]
      Drug.dosages.create!(
        :unit => unit,
        :strength => strength,
        :dose => dose,
        :frequency => frequency,
        :form => form,
        :route => route
   
      )
    end
  end
  puts "\n Indications created! \n\n"
end