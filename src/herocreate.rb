require './items'

module HeroCreate

	HERO_CLASS_ARRAY = ["fighter", "wizard", "rogue"]

	def choose_class
		puts choose_class_text
		HERO_CLASS_ARRAY.each_with_index{|val, index| puts "#{index + 1} - #{val.capitalize}"}
		input = gets.chomp.to_i - 1
		eval"self.#{HERO_CLASS_ARRAY[input]}"
	end

	def fighter
		@stats[:h_class] = 'Fighter'
		@stats[:hp] = 10
		@inventory.push(Item.new('LONGSWORD'))
		@inventory.push(Item.new('SHIELD'))
		@inventory.push(Item.new('CLOTH_ARMOR'))
		@inventory.each{|item| self.equip(item)}
	end

	def wizard
		@stats[:h_class] = 'Wizard'
		@stats[:hp] = 5
		@inventory.push(Item.new('DAGGER'))
		@inventory.push(Item.new('CLOTH_ARMOR'))
		@inventory.each{|item| self.equip(item)}
	end

	def rogue
		@stats[:h_class] = 'Rogue'
		@stats[:hp] = 7
		@inventory.push(Item.new('SHORTSWORD'))
		@inventory.push(Item.new('CLOTH_ARMOR'))
		@inventory.each{|item| self.equip(item)}
	end
end