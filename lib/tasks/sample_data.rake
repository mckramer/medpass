require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    # Reset database
    Rake::Task['db:reset'].invoke
    # Populate database
    # >> Locales
    make_sites
    make_divisions
    # >> Users
    make_roles
    make_users
    # >> Allergies
    make_allergens
    make_allergies
    # >> Prescriptions
    make_drugs
    make_indications
    make_dosages
    make_prescriptions
    # >> Diagnoses
    #make_conditions #TODO
    #make_procedures #TODO
    #make_diagnoses #TODO
    
    puts "=== SUCCESS ==="
  end
end

def make_users
  admin = Provider.create!(
    :name_first             => "Max",
    :name_last              => "Kramer",
    :email                  => "max@transition.maxkramer.me",
    :password               => "transitionpassword!",
    :password_confirmation  => "transitionpassword!",
    :type                   => "provider",
    :language               => "en",
    :site_id                => 1,
    :division_id            => 1,
    :role_ids               => [1, 2, 3, 4, 5]
  )
  30.times do |n|
    # Build common data
    email         = "example-#{n+1}@transition.org"
    password      = "password!"
    name_first    = Faker::Name.first_name
    name_last     = Faker::Name.last_name
    name_middle   = ("A".."Z").to_a.sample
    language      = rand(100) < 10 ? "es" : "en"
    type          = rand(100).even? ? "participant" : "provider"
    site          = Site.all.sample
    division      = Division.where(:site_id => site.id).sample
    
    if type == "participant"
      # Build custom data for participant
      name_suffix = rand(100) <= 15 ? ["Jr", "II", "III"].shuffle!.first : nil
      
      Participant.create!(
        :type                   => type,
        :email                  => email,
        :password               => password,
        :password_confirmation  => password,
        :name_first             => name_first,
        :name_last              => name_last,
        :name_middle            => name_middle,
        :name_suffix            => name_suffix,
        :language               => language,
        :site_id                => site.id,
        :division_id            => division.id
      )
      
    else
      # Build custom data for provider
      name_suffix    = rand(100).even? ? ["MD", "PhD", "RN"].shuffle!.first : nil
      role_ids  = random_roles
      
      Provider.create!(
      :type                   => type,
      :email                  => email,
      :password               => password,
      :password_confirmation  => password,
      :name_first             => name_first,
      :name_last              => name_last,
      :name_middle            => name_middle,
      :name_suffix            => name_suffix,
      :language               => language,
      :role_ids               => [5],
      :site_id                => site.id,
      :division_id            => division.id
    )
      
    end
  end
  puts "Users created."
end

def make_sites
  names = [ "University of North Carolina at Chapel Hill", "Ohio State University", "Duke University", "Texas University at Austin", "Miami University" ]
  abbrs = [ "UNC", "OSU", "Duke", "UT-Austin", "Miami" ]
  (names.length).times do |n|
    name = names[n]
    abbr  = abbrs[n]
    Site.create!(
      :name       => name,
      :abbr       => abbr
    )
  end
  puts "Sites created."
end

def make_divisions
  names = [ "Oncology", "Pediatric", "Podietry", "Gastro Intestinal", "Kidney" ]
  Site.all.each do |site|
    (names.length).times do |n|
      name = names[n]
      Division.create!(
        :name     => name,
        :abbr     => nil,
        :site_id  => site.id
      )
    end
  end
  puts "Divisions created."
end

def make_roles
  names = [ "Super administrator", "Study administrator", "Site coordinator", "Division coordinator", "Health provider" ]
  descriptions = [ "Can manage everything", "Can manage the study", "Can manage specific site", "Can manage specific division", "Can only manage their patients" ]
  (names.length).times do |n|
    name = names[n]
    description  = descriptions[n]
    Role.create!(
      :name           => name,
      :description    => description
    )
  end
  puts "Roles created."
end

def make_allergens
  names = [ "Peanuts", "Tree nuts", "Soy", "Water", "Wheat", "Shellfish", "Latex", "Milk", "Eggs", "MSG" ]
  (names.length).times do |n|
    name = names[n]
    description = Faker::Lorem.paragraph
    Allergen.create!(
      :name       => name,
      :abbr       => name,
      :description => description
    )
  end
  puts "Allergens created."
end

def make_allergies
  make_count = (0..3).to_a
  Participant.all.each do |participant|
    make_count.sample.times do
      allergen = Allergen.find :first, :offset => ( Allergen.count * rand ).to_i
      # No !.  Will skip if doesn't validate
      Allergy.create(
        :allergen_id => allergen.id,
        :user_id => participant.id
      )
    end
  end
  puts "Allergies created."
end

def make_drugs
  drugs = ['Albuterol', 'Alendronate', 'Amitriptyline', 'Amoxicillin', 'Atenolol', 'Baclofen', 'Benazepril', 'Bumetanide', 'Buspirone', 'Cephalexin', 'Chlorpropamide', 'Cimetidine', 'Ciprofloxacin', 'Citalopram', 'Clonidine', 'Cyclobenzaprine', 'Dexamethasone', 'Diclofenac', 'Dicyclomine', 'Diltiazem', 'Doxazosin', 'Doxepin Hcl', 'Doxycycline Hyclate', 'Enalapril', 'Estradiol', 'Estropipate', 'Famotidine', 'Fluocinonide', 'Fluoxetine', 'Folic Acid', 'Furosemide', 'Gentamicin', 'Glimepiride', 'Glipizide', 'Glyburide', 'Haloperidol', 'Hydralazine', 'Hydrochlorothiazide', 'Hydrocortisone', 'Ibuprofen', 'Indapamide', 'Isoniazid', 'Lactulose', 'Levothyroxine', 'Loratadine', 'Lovastatin', 'Magnesium Oxide', 'Medroxyprogesterone', 'Megestrol', 'Meloxicam', 'Metformin', 'Methyldopa', 'Methylprednisolone', 'Naproxen', 'Nortriptyline', 'Nystatin', 'Oxybutynin', 'Penicillin', 'Phenazopyridine', 'Pilocarpine', 'Potassium Chloride', 'Pravastatin', 'Prednisone', 'Prochlorperazine', 'Promethazine', 'Ranitidine', 'Spironolactone']
  50.times do |n|
    name          = drugs[n]
    description   = Faker::Lorem.paragraph
    Drug.create!(
      :name         => name,
      :description  => description
    )
  end
  #Drug.limit(10).each do |drug, n|
  #  parent = Drug.find_by_id(n + 15)
  #  drug.update!
  #end
  puts "Drugs created."
end

def make_indications
  # should complete "drug is used to ___", such as drug is used to lower blood pressure
  verbs = ['lower', 'raise', 'strengthen', 'weaken', 'improve', 'protect', 'reduce', 'relieve']
  nouns = ['blood pressure', 'cholesterol', 'the immune system', 'the number of white blood cells', 'minor aches and pains', 'minor inflammation', 'minor fever']
  make_count = (1..3).to_a
  Drug.all.each do |drug|
    make_count.sample.times do
      text = verbs[rand(verbs.length)] + ' ' + nouns[rand(nouns.length)]
      Indication.create!(
        :text         => text,
        :description  => Faker::Lorem.paragraph,
        :drug_id      => drug.id
      )
    end
  end
  puts "Indications created."
end

def make_dosages
  units_list = ['mg', 'mL']
  frequencies = [0, 6, 8, 12, 24, 56, 84, 168]
  forms = ['tablet', 'capsule', 'liquid', 'gel', 'cream']
  routes = ['oral', 'nasal', 'Intraveneous (IV)', 'Intramusculer (IM)', 'topical']
  make_count = (1..3).to_a
  Drug.all.each do |drug|
    make_count.sample.times do
      units = units_list.choice
      strength = rand(290) + 10
      dose = (rand(3) + 1) * strength
      frequency = frequencies.sample
      form = forms.sample
      route = routes.sample
      Dosage.create!(
        :units => units,
        :strength => strength,
        :dose => dose,
        :frequency => frequency,
        :form => form,
        :route => route,
        :drug_id => drug.id
      )
    end
  end
  puts "Dosages created."
end

def make_prescriptions
  make_count = (0..3).to_a
  Participant.all.each do |participant|
    make_count.sample.times do
      drug = Drug.find :first, :offset => ( Drug.count * rand ).to_i
      indication = drug.indications.sample
      dosage = drug.dosages.sample
      prescribed_at = rand(5.days).ago
      archived_at = rand(100).even? ? Time.now : nil 
      # No !.  Will skip if doesn't validate
      Prescription.create(
        :drug_id        => drug.id,
        :indication_id  => indication.id,
        :dosage_id      => dosage.id,
        :user_id        => participant.id,
        :prescribed_at  => prescribed_at,
        :archived_at    => archived_at,
        :note           => Faker::Lorem.paragraph
      )
    end
  end
  puts "Prescriptions created."
end

private
def random_roles
  role_ids = Array.new
  Role.all do |role|
    if role.name.lowercase == "health provider"
      role_ids[] = role.id
      return role_ids
    end
  end
end