
module GenMods

	def name
		@stats[:name]
	end

	def stats
		@stats
	end

	def initiative
		@stats[:initiative]
	end

	def set_initiative(num)
		@stats[:initiative] = num
	end

	def player?
		self.stats.has_key?(:player)
	end

	def monster?
		self.stats.has_key?(:monster)
	end

	def hp
		@stats[:hp]
	end

	def xp
		@stats[:xp]
	end

	def dead?
		self.hp <= 0
	end

	def alive?
		self.hp > 0
	end

	def take_damage(dmg)
		@stats[:hp] -= dmg
	end

	def equipped
		@equipment
	end

	def equip(thing)
		case
		when thing.slot == "main_h"
			@equipment[:main_h] = thing
		when thing.slot == "off_h"
			@equipment[:off_h] = thing
		when thing.slot == "body"
			@equipment[:body] = thing
		else
			puts "You can't equip that!"
		end
	end
end
