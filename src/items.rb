

class Item

	def initialize(item = {name: 'empty'})
		@properties = Hash.new
		@properties = eval("#{item}")
	end

	def properties
		@properties
	end

	def name
		@properties[:name]
	end

	def slot
		@properties[:slot]
	end

	def dice
		@properties[:dice]
	end

	def weapon?
		self.properties.has_key?(:weapon)	
	end
	def armor?
		self.properties.has_key?(:armor)	
	end
	
	#WEAPONS

	LONGSWORD = {name: 'Longsword', dice: ["W_ATK", "W_ATK"], weapon: 'true', value: 10, slot: "main_h"}

	FIRE_FIST = {name: 'Fire Fist', dice: ["FIRE_DIE"], weapon: 'true', value: 15, slot: "off_h"}

	DAGGER = {name: 'Dagger', dice: ["W_ATK"], weapon: 'true', value: 3, slot: "main_h"}

	SHORTSWORD = {name: 'Shortsword', dice: ["W_ATK"], weapon: 'true', value: 5, slot: "main_h"}

	BATTLE_AXE = {name: 'Battle-Axe', dice: ["W_ATK", "W_ATK", "W_ATK"], weapon: 'true', value: 25, slot: "main_h"}

	#ARMOR

	SHIELD = {name: 'Shield', dice: ["W_DEF"], armor: 'true', slot: "off_h"}

	CLOTH_ARMOR = {name: 'Cloth Armor', dice: ["W_DEF"], armor: 'true', slot: "body"}

end