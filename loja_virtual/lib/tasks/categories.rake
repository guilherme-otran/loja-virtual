namespace :categories do
  desc "Add the default categories"

  task create: :environment do
    Category.create( id: 1, name: 'Male')
    Category.create( id: 2, name: 'Female')
    Category.create( id: 3, name: 'Child')
    
    puts "Categories created"
  end
  
  namespace :pt do
    task translate: :environment do
      Category.where(name: "Male").each do |c|
        c.name = 'Masculino'
        c.save
      end
      
      Category.where(name: "Female").each do |c|
        c.name = 'Feminino'
        c.save
      end
      
      Category.where(name: "Child").each do |c|
        c.name = 'Infantil'
        c.save
      end
      
      puts "Categorias traduzidas"
    end
  end
end