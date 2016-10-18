class Armour: Item {
    var defense: Int
    var armourType: ArmourType
    var armourSlot: ArmourSlot
    
    init(name: String, weight: Int, defense: Int, armourType: ArmourType, armourSlot: ArmourSlot) {
        self.defense = defense
        self.armourType = armourType
        self.armourSlot = armourSlot
        super.init(name: name, weight: weight)
    }
}