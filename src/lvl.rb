module Leveling

	XP_TABLE = {'2' => 2, '3' => 5, '4' => 15, '5' => 30}

	def gain_xp(monster)
		case
		when self.level > 2 && monster.name == 'Goblin'
			puts "You are too strong gain xp from this foe!"
		else
			@stats[:xp] += monster.k_xp
		end
	end

	def xp_check
		XP_TABLE.each do |level, xp|
			if self.level < level.to_i && self.xp >= xp
				self.level_up
			end
		end
	end

	def level_up
		@stats[:level] += 1
		case
		when self.class? == "Fighter"
			self.fighter_up
		when self.class? == "Wizard"
			self.wizard_up
		when self.class? == "Rogue"
			self.rogue_up
		end
	end

	def fighter_up
		hp_roll = Dice.d10
		@stats[:max_hp] += hp_roll
		@stats[:hp] = @stats[:max_hp]
		@stats[:mgk] += 1
		@stats[:atk_level] += 1
		puts "You leveled up! You gained #{hp_roll} health! You are now level #{self.level}!"
	end
	def wizard_up
		@stats[:max_hp] += 5
		@stats[:hp] = @stats[:max_hp]
		@stats[:mgk] += 1
		@stats[:atk_level] += 1
		puts "You have leveled up!"
	end
	def rogue_up
		@stats[:max_hp] += 7
		@stats[:hp] = @stats[:max_hp]
		@stats[:mgk] += 1
		@stats[:atk_level] += 1
		puts "You have leveled up!"
	end
end