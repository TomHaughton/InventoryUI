class Weapon: Item {
    var attack: Int
    var weaponType: WeaponType
    
    init(name: String, weight: Int, attack: Int, weaponType: WeaponType) {
        switch weaponType{
        case WeaponType.Axe:
            self.weaponType = WeaponType.Axe
            break
        case WeaponType.Sword:
            self.weaponType = WeaponType.Sword
            break
        case WeaponType.Bow:
            self.weaponType = WeaponType.Bow
            break
        }
        self.attack = attack
        super.init(name: name, weight: weight)
    }
}