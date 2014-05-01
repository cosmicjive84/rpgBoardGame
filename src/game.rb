require './interface'
require './hero'
require './dice'
require './monster'
require './items'
require 'yaml'

class Game
	def initialize
	end

	include Interface

	def new_game
		Hero.hero_list.clear
		puts player_num_text
		num = gets.chomp
		Hero.generate(num)
	end

	def start_game
		main_menu
	end

	def setup_monster
		Monster.monster_list.clear
		puts monster_num_text
		num = gets.chomp
		Monster.generate(num)
	end

	def setup_fight
		@battle_order = Array.new
		Hero.hero_list.each{|hero| hero.set_initiative(Dice.d20); @battle_order.push(hero)}
		Monster.monster_list.each{|monster| monster.set_initiative(Dice.d20); @battle_order.push(monster)}
		@battle_order = @battle_order.sort{|x,y| y.initiative <=> x.initiative}
	end

	def battle_round
		while Monster.monster_list.any?{|monster| monster.alive?} && Hero.hero_list.any?{|hero| hero.alive?}	
			@battle_order.each do |char|
				if char.player? && char.alive?
					player_turn_menu(char)
					if Monster.monster_list.all?{|m| m.dead?}
						puts "You are victorious!"
						town_menu
					end
					#@battle_order.delete_if { |x| x.dead? }
				elsif char.monster? && char.alive?
					puts "#{char.name} - #{char.hp}"
					monster_turn(char)
					if Hero.hero_list.all?{|h| h.dead?}
						puts "You lose..."
						main_menu
					end
					#@battle_order.delete_if { |x| x.dead? }
				else
				 	#main_menu
				end	
			end
		end
	end

	def choose_target
		choose_target_text
		input = gets.chomp
		return @battle_order[input.to_i]
	end

	def ai_choose_target
		t = @battle_order.select{|char| char.player?}
		return t.sample
	end

	def monster_turn(m)
		m.attack(ai_choose_target)
	end

end

# g = Game.new
# g.start_game


SL.saveWeapon(Item::BATTLE_AXE)

