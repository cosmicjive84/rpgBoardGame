require './text'
require './saveload'

module Interface

	include Text

	def main_menu
		puts main_menu_text
		input = gets.chomp
		case
		when input.downcase == 'n'
			new_game
			town_menu
		when input.downcase == 'e'
			exit
		when input.downcase == 'l'
			SL.loadGame
			town_menu
		else
			puts poor_choice_text
			main_menu
		end
	end

	def town_menu
		puts town_menu_text
		input = gets.chomp
		case
		when input.downcase == 'a'
			arena_menu
		when input.downcase == 'm'
			main_menu
		when input.downcase == 'p'
			party_menu
		when input.downcase == 's'
			SL.saveGame()
			town_menu
		when input.downcase == 'l'
			blackSmithMenu
		else
			puts poor_choice_text
			town_menu
		end
	end

	def blackSmithMenu
		puts blackSmithMenuText
		town_menu
	end

	def arena_menu
		puts arena_menu_text
		input = gets.chomp
		case
		when input.downcase == 's'
			setup_monster
			arena_menu
		when input.downcase == 'i'
			Monster.monster_list.each{|m| puts m.monster_info}
			arena_menu
		when input.downcase == 'f'
			setup_fight
			battle_menu
		when input.downcase == 'p'
			party_menu
		when input.downcase == 'b'
			town_menu
		else
			puts poor_choice_text
			arena_menu
		end
	end

	def battle_menu
		battle_menu_text
		battle_round
	end

	def player_turn_menu(hero)
		puts player_turn_menu_text(hero)
		input = gets.chomp
		case
		when input.downcase == 's'
			hero.show_stats
			puts hero_menu_text
			input = gets.chomp
			case
			when input.downcase == "b"
				player_turn_menu(hero)
			when input.downcase == "e"
				puts equip_item_text
				hero.inventory.each_with_index{|value, index| puts "#{index + 1} - #{value.name}"}
				input = gets.chomp
				if input.downcase == 'b'
					player_turn_menu(hero)
				elsif input.to_i <= hero.inventory.length
					item = hero.inventory[input.to_i - 1]
					hero.equip(item)
					player_turn_menu(hero)
				else
					puts poor_choice_text
					player_turn_menu(hero)
				end
			else
				puts poor_choice_text
				hero_menu(hero)
			end
		when input.downcase == 'a'
			target = choose_target
			hero.attack(target)
		when input.downcase == 'b'
			@battle_order.each{|x| puts "Initiative - #{x.initiative}, #{x.name}"}
			player_turn_menu(hero)
		else

		end
	end

	def party_menu
		party_menu_text
		input = gets.chomp
		if input.downcase == 'b'
			town_menu
		elsif input.to_i <= Hero.hero_list.length
			p = Hero.hero_list.find{|x| x.playerno == input.to_i}
			hero_menu(p)
		else
			puts poor_choice_text
			party_menu
		end
	end

	# def equip_menu(hero, prev_menu)
	# 	puts equip_item_text
	# 	hero.inventory.each_with_index{|value, index| puts "#{index + 1} - #{value.name}"}
	# 	input = gets.chomp
	# 	if input.downcase == 'b'
	# 		hero_menu(hero)
	# 	elsif input.to_i <= hero.inventory.length
	# 		item = hero.inventory[input.to_i - 1]
	# 		hero.equip(item)
	# 		hero_menu(hero)
	# 	else
	# 		puts poor_choice_text
	# 		hero_menu(hero)
	# 	end
	# end

	def hero_menu(hero)
		hero.show_stats
		puts hero_menu_text
		input = gets.chomp
		case
		when input.downcase == "b"
			party_menu
		when input.downcase == "e"
			puts equip_item_text
			hero.inventory.each_with_index{|value, index| puts "#{index + 1} - #{value.name}"}
			input = gets.chomp
			if input.downcase == 'b'
				hero_menu(hero)
			elsif input.to_i <= hero.inventory.length
				item = hero.inventory[input.to_i - 1]
				hero.equip(item)
				hero_menu(hero)
			else
				puts poor_choice_text
				hero_menu(hero)
			end
		else
			puts poor_choice_text
			hero_menu(hero)
		end
	end

end