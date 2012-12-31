namespace :categories do
  desc "Add the default categories"
  
  task :create => :environment do
    Category.create( id: 1, :name => 'Male' )
    Category.create( id: 2, :name => 'Female' )
    Category.create( id: 3, :name => 'Child' )
  end

end