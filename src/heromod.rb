require './text'
require './herocreate'

module HeroMod
	include Text

	def name_hero
		puts name_hero_text
		@stats[:name] = gets.chomp.capitalize
	end

	def info
		"Player - #{self.playerno}, Name: #{self.name}, Class: #{self.h_class}"
	end

	def show_stats
		puts "Player - #{self.playerno}, Name: #{self.name}, Class: #{self.h_class}, HP: #{self.hp}\nLevel: #{self.level}, XP: #{self.xp}, Gold: #{self.gold}\nInventory:\n"
		self.inventory.each_with_index{|value, index| puts "#{index + 1} - #{value.name}"}
		self.equipped.each{|k,v| puts "#{k} - #{v.name}"}
	end

	def playerno
		@stats[:player]
	end

	def h_class
		@stats[:h_class]
	end

	def gold
		@stats[:gold]
	end

	def inventory
		@inventory
	end

	def level
		@stats[:level]
	end

	# def xp
	# 	@stats[:xp]
	# end

end
