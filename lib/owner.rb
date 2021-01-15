require "pry"
class Owner
  @@all = []
  # attr_accessor :pets
  attr_reader :name, :species
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    # @pets = {dogs:[], cats:[]}
  end
  def say_species
    "I am a human."
  end
  def self.all
    @@all
  end
  def self.count
    @@all.count
  end
  def self.reset_all
    @@all.clear()
  end
  def cats
    Cat.all.select { |cat| cat.owner == self}
  end
  def dogs
    Dog.all.select { |dog| dog.owner == self}
  end
  def buy_cat (name)
    Cat.new(name, self)
  end
  def buy_dog (name)
    Dog.new(name, self)
  end
  def walk_dogs
    Dog.all.each do |dog|
      dog.mood = "happy"
    end
  end
  def feed_cats
    Cat.all.each do |cat|
      cat.mood = "happy"
    end
  end
  def sell_pets
    Dog.all.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    Cat.all.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
  end
  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end