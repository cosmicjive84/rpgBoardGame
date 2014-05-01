

module Dice

	W_ATK = ['hit','hit','hit','miss','miss','miss']

	W_DEF = ['armor', 'miss']

	FIRE_DIE = ['fire', 'miss']

	def self.hit(x)
		x[:standard] += 1
		#@attack_roll[:standard] += 1
	end

	def self.hit2(x)
		x[:standard] += 2
		#@attack_roll[:standard] += 2
	end
		
	def self.fire(x)
		x[:fire] += 1
		#@attack_roll[:fire] += 1
	end

	def self.frost(x)
		x[:frost] += 1
		#@attack_roll[:frost] += 1
	end

	def self.miss(x)
	end

	def self.armor(x)
		x[:standard] -= 1
		x[:standard] = [x[:standard], 0].max
	end

	def self.d4
		rand 1..4
	end
	
	def self.d6
		rand 1..6
	end
	
	def self.d8
		rand 1..8
	end
	
	def self.d10
		rand 1..10
	end
	
	def self.d12
		rand 1..12
	end
	
	def self.d20
		rand 1..20
	end
end