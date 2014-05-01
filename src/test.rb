require './interface'

class Test
	def initialize(num)
		@num = num
	end

	def say
		puts @num
	end
end

@test_array = Array.new
def gen(x)
	t = 1
	while t <= x
		@test_array.push(Test.new(t))
		t += 1
	end
end


#gen(5)

#ObjectSpace.each_object(Test) {|x| x.say}

HQ_DIE = ['hit','hit','hit2','miss','miss','miss']
FIRE_DIE = ['fire', 'miss']
FROST_DIE = ['frost', 'miss']

def roll(t, die)
	t.times {puts die.sample}
end

def hit
	@attack[:standard] += 1
end

def hit2
	@attack[:standard] += 2
end
	
def fire
	@attack[:fire] += 1
end

def frost
	@attack[:frost] += 1
end

def miss
end

player_dice = ["HQ_DIE", "HQ_DIE", "HQ_DIE", "FIRE_DIE", "FROST_DIE", "FIRE_DIE"]

def attack_roll(dice)
	ar = Array.new
	@attack = {:standard => 0, :fire => 0, :frost => 0}
	dice.each { |die| ar.push(eval("#{die}.sample"))}
	ar.each {|x| puts x; sleep(0.5); eval"#{x}"}
	puts @attack.inspect
	puts @attack.values.reduce(:+)
end

		Dice.send(x,@attack_roll)
		eval("Dice.#{x}(@attack_roll)")


def heal(x)
	x = [x, 50].min
end

class Weapon
	def initialize
		@prop = {dice: "", name: "", value: 0, category: ""}
	end
end

#eval("#{die}.sample")
#die.sample
#puts heal(555)

#attack_roll(player_dice)
#puts player_dice

#gen(5)
#puts @test_array.each.inspect


