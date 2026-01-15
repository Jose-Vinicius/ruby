# class Animal
# 	attr_accessor :name, :age

# 	def initialize(name, age)
# 		self.name = name
# 		self.age = age
# 	end

# 	def speak
# 		"diz:"
# 	end
# end

# class Dog < Animal
# 	attr_accessor :color

# 	def initialize(name, age, color)
# 		super(name, age)
# 		self.color = color
# 	end

# 	# def change_info(n, a)
# 	# 	self.name = n
# 	# 	self.age = a
# 	# end

# 	# def self.what_is_self
# 	# 	"teste"
# 	# end

# 	def info
# 		"name: #{self.name}, age: #{self.age}, color: #{self.color}"
# 	end
# 	def speak
# 		super + "Au Au"
# 	end

# 	# p self #faz referencia a classe onde foi chamado, equivalente a metodos de classe onde se referencia diretamente a classe
# end

# class Cat < Animal
# 	def speak
# 		super + "miau "
# 	end
# end

# flor = Dog.new("Flor", 2, "black and white")
# # principe = Cat.new
# # puts flor.name #=> "Flor"
# # flor.name = "Flor Maria"
# # puts flor.name #=> "Flor Maria"
# # flor.change_info('Maria Flor', 4)
# # puts flor.info
# #

# puts flor.info
# # puts principe.speak
# #

# module Mammal
# 	def say_hello
# 		p "Hello"
# 	end

# 	class Dog
# 		include Mammal
# 		def speak
# 			p "Au Au"
# 		end
# 	end

# 	class Cat
# 		def speak
# 			p "Miau"
# 		end
# 	end
# end

# flor = Mammal::Dog.new
# principe = Mammal::Cat.new

# flor.say_hello
# principe.speak
#

class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a
  end

  def humanAge
    "#{name} in human years is #{human_years}"
  end

  protected

  def human_years
    age * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
sparky.human_years
# p sparky.humanAge
