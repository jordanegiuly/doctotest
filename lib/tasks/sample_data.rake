require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    
    users_count = 9
    fake_addresses = [
      { :address => "12 rue Frochot", :postal_code => 75009, :city => "Paris"},
      { :address => "137 rue du Faubourg du Temple", :postal_code => 75010, :city => "Paris"},
      { :address => "41 rue Montmartre", :postal_code => 75002, :city => "Paris"},
      { :address => "109 rue Oberkampf", :postal_code => 75011, :city => "Paris"},
      { :address => "138 rue du Faubourg Saint-Antoine", :postal_code => 75012, :city => "Paris"},
      { :address => "62 rue Quincampoix", :postal_code => 75004, :city => "Paris"},
      { :address => "23 rue du Temple", :postal_code => 75004, :city => "Paris"},
      { :address => "74 rue de la Roquette", :postal_code => 75011, :city => "Paris"},
      { :address => "124 Rue de la Boetie", :postal_code => 75008, :city => "Paris"}
    ]
    
    users_count.times do |i|
      User.create!(:last_name => Faker::Name.last_name, 
                   :first_name => Faker::Name.first_name, 
                   :address => fake_addresses[i][:address],
                   :postal_code => fake_addresses[i][:postal_code],
                   :city => fake_addresses[i][:city],
                   :specialty => Random.rand(User.specialties.count) # random specialty
                  )
    end
    
    print "\n USERS: " + User.count.to_s + "/" + users_count.to_s + "\n"
  end
end