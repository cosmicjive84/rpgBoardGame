require './attack'

module Text

	def main_menu_text
		"Welcome to RPG Arena!\n(N)ew Game - (L)oad Game - (E)xit"
	end

	def town_menu_text
		"You are in town!\nWhat would you like to do:\nView(P)arty - (A)rena - B(l)acksmith - (S)ave - (M)ain Menu"
	end

	def arena_menu_text
		"(S)etup-Monsters, Monster-(I)nfo, View-(P)arty, (F)ight!, (B)ack"
	end

	def blackSmithMenuText
		"Welcome to my shop! Would you like to view (W)eapons / (A)rmor? (B)ack"
	end

	def battle_menu_text
		puts "The battle begins!"
		@battle_order.each{|x| puts "Initiative - #{x.initiative}, #{x.name}"}
	end

	def poor_choice_text
		"You have chosen poorly..."
	end

	def name_hero_text
		"Player #{self.playerno}, what is your name?"
	end

	def choose_class_text
		"#{self.name}, choose a character class:"
	end

	def player_num_text
		"How many players?"
	end

	def monster_num_text
		"How many monsters?"
	end

	def party_menu_text
		puts "Choose a hero to inspect: "
		Hero.hero_list.each{|x|puts x.info}
		puts "Player - (#), (B)ack to town!"
	end

	def hero_menu_text
		"(E)quip items, (B)ack"
	end

	def equip_item_text
		"Select item to equip:(#), (B)ack"
	end

	def player_turn_menu_text(player)
		"#{player.name}, it is your turn!\nChoose an action: (A)ttack, (C)ast Spell, (S)tats/Inventory, (B)attleOrder"
	end

	def choose_target_text
		"Select your target:"
		@battle_order.each_with_index{ |val, index| puts "#{index} - #{val.name} - Hp:#{val.hp}"}
	end

end