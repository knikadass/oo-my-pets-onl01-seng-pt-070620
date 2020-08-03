require "pry"
class Owner
  attr_reader :species, :name
  #attr_accessor :dogs, :cats
  attr_writer :dogs, :cats

  @@all = []

  def initialize(name)
    @species = species
    @name = name
    @@all << self
    @cats = []
    @dogs = []
  end

  def species 
    @species = "human"
  end
  
  def self.all
    @@all
  end

  def cats 
    Cat.all.select{|cat| cat.owner == self}
  end

  def dogs 
    Dog.all.select{|dog| dog.owner == self}
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end
  
  def say_species
   # self.species
   # binding.pry
    "I am a #{self.species}."
  end

  

 def buy_cat(name)
    Cat.new(name, self)
  end 

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets 
    pets = self.dogs + self.cats 

    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil 
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end