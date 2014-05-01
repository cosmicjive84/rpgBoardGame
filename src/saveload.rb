require 'yaml'
require './hero'

module SL

	def self.saveGame(game = Hero.hero_list)
		puts "Enter a name for your game."
		gameName = gets.chomp
		file = File.new("./save/#{gameName.downcase}"+".yml", 'w')
		file.puts game.to_yaml
		file.close
	end

	def self.loadGame
		puts "Choose game to load."
		puts Dir.entries("./save/.")
		puts "Do not include file extension .yml"
		game = gets.chomp
		file = File.open("./save/#{game}" + ".yml", 'r')
		Hero.heroListLoad(YAML.load(file.read))
		file.close
		puts Hero.hero_list
	end

	def self.saveWeapon(weapon)
		file = File.open("./items/weapons.yml", 'a')
		file.write weapon.to_yaml
		file.close
	end

end