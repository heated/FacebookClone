namespace :facebook_clone do
  desc "TODO"
  task :dl_cats => :environment do
    Dir.chdir('seed_images')
    300.upto(309) do |x|
      300.upto(309) do |y|
        `wget http://placekitten.com/g/#{x}/#{y}`
      end
    end
  end
end