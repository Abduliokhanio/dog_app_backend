# app/workers/dog_ssn_updater_worker.rb
class DogSsnUpdaterWorker
  include Sidekiq::Worker

  def perform
    dogs = Dog.where(ssn: nil).or(Dog.where(ssn: '')).limit(2)
    
    if dogs.blank?
      puts "Congradulations! All dogs are completed!" 
      return
    end

    dogs.each do |dog|
      dog.update(ssn: generate_fake_ssn)
      puts "Updated SSN for Dog ID: #{dog.id}"
    end

    puts "Updated #{dogs.count} dogs' SSNs at #{Time.now}" if dogs.any?
  end

  private

  def generate_fake_ssn
    Array.new(9) { rand(0..9) }.join
  end
end
