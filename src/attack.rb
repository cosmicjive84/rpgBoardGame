require './dice'
require './text'


module Attack

	include Dice

	def atk_dice
		# self.equipped.map{|q, k|
		# 	if thing.weapon?
		# 		thing.dice
		# 	end
		# }.flatten
		attack_dice = Array.new
		self.equipped.each do |key, thing|
			if thing.weapon?
				attack_dice.push(thing.dice)
			end	
		end
		return attack_dice.flatten
	end

	def def_dice
		defence_dice = Array.new
		self.equipped.each do |key, thing|
			if thing.armor?
				defence_dice.push(thing.dice)
			end
		end
		return defence_dice.flatten
	end

	def attack(target)
		atk_dice = self.atk_dice
		ar = Array.new
		@attack_roll = {:standard => 0, :fire => 0, :frost => 0}
		atk_dice.each { |die| ar.push(eval("#{die}.sample"))}
		ar.each {|x| puts x; sleep(0.5); eval"Dice.#{x}(@attack_roll)"}
		target.defend(@attack_roll)
		puts @attack_roll.inspect
		total_damage = @attack_roll.values.reduce(:+)
		target.take_damage(total_damage)
		puts "#{self.name} did #{total_damage} to #{target.name}, Hp:#{target.hp}"
	end

	def defend(attack_roll)
		def_dice = self.def_dice
		dr = Array.new
		def_dice.each{|die| dr.push(eval("#{die}.sample"))}
		dr.each {|x| puts x; sleep(0.5); eval"Dice.#{x}(attack_roll)"}
		return attack_roll
	end

end