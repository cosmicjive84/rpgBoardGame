require './heromod'
require './herocreate'
require './genmods'
require './attack'
require './lvl'
require './saveload'

class Hero
	@@hero_list = Array.new
	def initialize()
		@stats = { name: "", h_class: "Peasant", level: 1, xp: 0, hp: 1, gold: 0, initiative: 0, player: true}
		@equipment = {main_h: Item.new, off_h: Item.new, body: Item.new}
		@inventory = []
		@stats[:player] = Hero.hero_list.length + 1
		self.name_hero
		self.choose_class
		Hero.hero_list.push(self)
	end

	include HeroMod
	include HeroCreate
	include GenMods
	include Attack
	include Leveling

	def self.hero_list
		@@hero_list
	end

	def self.heroListLoad(gameFile)
		@@hero_list = gameFile
	end

	def self.generate(num)
		num.to_i.times do
			Hero.new()
			puts Hero.hero_list.length
		end
	end

end
