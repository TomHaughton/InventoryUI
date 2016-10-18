class Player {
    var health: Int
    var defense: Int
    var attack: Int
    var inventory = Inventory(capacity: 1000, amountFilled:0)
    
    //Armour/Weapon slots
    var head: Armour?
    var chest: Armour?
    var arms: Armour?
    var legs: Armour?
    var weapon: Weapon?
    
    init(){
        self.health = 100
        self.defense = 0
        self.attack = 0
    }
    
    func unequip(item: Item) {
        if let toUnequip = item as? Armour{
            switch toUnequip.armourSlot {
            case ArmourSlot.Head:
                if moveFromPlayerToInv(item){
                    self.head = nil
                    defense -= toUnequip.defense
                }
                break
            case ArmourSlot.Chest:
                if moveFromPlayerToInv(item){
                    self.chest = nil
                    defense -= toUnequip.defense
                }
                break
            case ArmourSlot.Arms:
                if moveFromPlayerToInv(item){
                    self.arms = nil
                    defense -= toUnequip.defense
                }
                break
            case ArmourSlot.Legs:
                if moveFromPlayerToInv(item){
                    self.legs = nil
                    defense -= toUnequip.defense
                }
                break
            }
        } else if let toUnequip = item as? Weapon{
            if moveFromPlayerToInv(item){
                self.weapon = nil
                attack -= toUnequip.attack
            }
        }
    }
    
    func equip(item: Item) {
        if let toEquip = item as? Armour{
            switch toEquip.armourSlot {
            case ArmourSlot.Head:
                if self.head != nil {
                    defense -= self.head!.defense
                    moveFromPlayerToInv(self.head!)
                }
                self.head = toEquip
                defense += toEquip.defense
                moveFromInvToPlayer(item)
                break
            case ArmourSlot.Chest:
                if self.chest != nil {
                    defense -= self.chest!.defense
                    moveFromPlayerToInv(self.chest!)
                }
                self.chest = toEquip
                defense += toEquip.defense
                moveFromInvToPlayer(item)
                break
            case ArmourSlot.Arms:
                if self.arms != nil {
                    defense -= self.arms!.defense
                    moveFromPlayerToInv(self.arms!)
                }
                self.arms = toEquip
                defense += toEquip.defense
                moveFromInvToPlayer(item)
                break
            case ArmourSlot.Legs:
                if self.legs != nil {
                    defense -= self.legs!.defense
                    moveFromPlayerToInv(self.legs!)
                }
                self.legs = toEquip
                defense += toEquip.defense
                moveFromInvToPlayer(item)
                break
            }
        } else if let toEquip = item as? Weapon{
            if self.weapon != nil {
                attack -= self.weapon!.attack
                moveFromPlayerToInv(self.weapon!)
            }
            self.weapon = toEquip
            attack += toEquip.attack
            moveFromInvToPlayer(item)
        }
    }
    
    func moveFromInvToPlayer(item: Item) {
        if let index = inventory.items.indexOf(item){
            inventory.amountFilled -= inventory.items[index].weight!
            inventory.items.removeAtIndex(index)
        }
    }
    
    func moveFromPlayerToInv(item: Item) -> Bool{
        return inventory.addItem(item)
    }
}