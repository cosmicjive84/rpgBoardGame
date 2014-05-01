require './genmods'
require './attack'

class Monster
	@@monster_list = Array.new
	def initialize
		@stats = {name: "Monster", hp: 3, xp: 1, initiative: 0, monster: true}
		@equipment = {main_h: Item.new, off_h: Item.new}
		self.equip(Item.new('BATTLE_AXE'))
		Monster.monster_list.push(self)
	end

	include GenMods
	include Attack

	def self.monster_list
		@@monster_list
	end

	def self.generate(num)
		monster_num = 1
		while monster_num <= num.to_i
			Monster.new
			monster_num += 1
		end
	end

	def monster_info
		"#{self.name} - HP: #{self.hp}\n#{self.equipped}"
	end

	# def self.monster_turn(monster)
	# 	monster.
	# end

end
