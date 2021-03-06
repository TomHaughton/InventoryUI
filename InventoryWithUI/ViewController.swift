import UIKit

class ViewController: UIViewController {
    
    var player = Player()
    //Player space
    let headSpace = CGRectMake(125, 100, 80, 50)
    let chestSpace = CGRectMake(125, 200, 80, 50)
    let armSpace = CGRectMake(0, 200, 80, 50)
    let weaponSpace = CGRectMake(250, 200, 80, 50)
    let legSpace = CGRectMake(125, 300, 80, 50)
    
    //Inventory space
    let invSpace = CGRectMake(0, 400, 60, 50)
    let invSpace1 = CGRectMake(65, 400, 60, 50)
    let invSpace2 = CGRectMake(130, 400, 60, 50)
    let invSpace3 = CGRectMake(195, 400, 60, 50)
    let invSpace4 = CGRectMake(260, 400, 60, 50)
    let invSpace5 = CGRectMake(0, 460, 60, 50)
    let invSpace6 = CGRectMake(65, 460, 60, 50)
    let invSpace7 = CGRectMake(130, 460, 60, 50)
    let invSpace8 = CGRectMake(195, 460, 60, 50)
    let invSpace9 = CGRectMake(260, 460, 60, 50)
    
    //Buttons
    var head = UIButton()
    var chest = UIButton()
    var arms = UIButton()
    var weapon = UIButton()
    var legs = UIButton()
    var inventory = [UIButton]()

    override func viewDidLoad() {
        super.viewDidLoad()
        player.equip(TestBow())
        player.equip(TestChest())
        player.equip(TestLegs())
        player.inventory.addItem(TestHelmet())
        player.inventory.addItem(TestSword())
        player.inventory.addItem(TestArms())
        player.inventory.addItem(TestAxe())
        
        head = UIButton(frame: headSpace)
        chest = UIButton(frame: chestSpace)
        arms = UIButton(frame: armSpace)
        weapon = UIButton(frame: weaponSpace)
        legs = UIButton(frame: legSpace)
        
        head.setTitle(player.head?.name != nil ? player.head!.name : "None", forState: UIControlState.Normal)
        chest.setTitle(player.chest?.name != nil ? player.chest!.name : "None", forState: UIControlState.Normal)
        arms.setTitle(player.arms?.name != nil ? player.arms?.name : "None", forState: UIControlState.Normal)
        weapon.setTitle(player.weapon?.name != nil ? player.weapon?.name : "None", forState: UIControlState.Normal)
        legs.setTitle(player.legs?.name != nil ? player.legs?.name : "None", forState: UIControlState.Normal)
        
        head.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        chest.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        arms.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        weapon.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        legs.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
        head.backgroundColor = UIColor.brownColor()
        chest.backgroundColor = UIColor.brownColor()
        arms.backgroundColor = UIColor.brownColor()
        weapon.backgroundColor = UIColor.brownColor()
        legs.backgroundColor = UIColor.brownColor()
        
        head.addTarget(self, action: Selector("headButtonPressed:"), forControlEvents: UIControlEvents.TouchUpInside)
        chest.addTarget(self, action: Selector("chestButtonPressed:"), forControlEvents: UIControlEvents.TouchUpInside)
        arms.addTarget(self, action: Selector("armsButtonPressed:"), forControlEvents: UIControlEvents.TouchUpInside)
        weapon.addTarget(self, action: Selector("weaponButtonPressed:"), forControlEvents: UIControlEvents.TouchUpInside)
        legs.addTarget(self, action: Selector("legsButtonPressed:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        setupInventory()
        view.addSubview(head)
        view.addSubview(chest)
        view.addSubview(arms)
        view.addSubview(weapon)
        view.addSubview(legs)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupInventory(){
        for _ in 0...9 {
            inventory.append(UIButton())
        }
        inventory[0] = UIButton(frame: invSpace)
        inventory[1] = UIButton(frame: invSpace1)
        inventory[2] = UIButton(frame: invSpace2)
        inventory[3] = UIButton(frame: invSpace3)
        inventory[4] = UIButton(frame: invSpace4)
        inventory[5] = UIButton(frame: invSpace5)
        inventory[6] = UIButton(frame: invSpace6)
        inventory[7] = UIButton(frame: invSpace7)
        inventory[8] = UIButton(frame: invSpace8)
        inventory[9] = UIButton(frame: invSpace9)
        for index in 0...9 {
            view.addSubview(inventory[index])
            inventory[index].setTitle(getInvItemName(index) != nil ? getInvItemName(index)! : "", forState: UIControlState.Normal)
            inventory[index].setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            inventory[index].addTarget(self, action: Selector("invButtonPressed:"), forControlEvents: UIControlEvents.TouchUpInside)
            inventory[index].backgroundColor = UIColor.brownColor()
        }
    }
    
    func getInvItemName(index: Int) -> String? {
        if index < player.inventory.items.count {
            return player.inventory.items[index].name
        }
        return nil
    }
    
    func updateScreen(){
        head.setTitle(player.head?.name != nil ? player.head!.name : "None", forState: UIControlState.Normal)
        chest.setTitle(player.chest?.name != nil ? player.chest!.name : "None", forState: UIControlState.Normal)
        arms.setTitle(player.arms?.name != nil ? player.arms?.name : "None", forState: UIControlState.Normal)
        weapon.setTitle(player.weapon?.name != nil ? player.weapon?.name : "None", forState: UIControlState.Normal)
        legs.setTitle(player.legs?.name != nil ? player.legs?.name : "None", forState: UIControlState.Normal)
        
        for index in 0...9 {
            view.addSubview(inventory[index])
            inventory[index].setTitle(getInvItemName(index) != nil ? getInvItemName(index)! : "", forState: UIControlState.Normal)
        }

    }
    
    @IBAction func invButtonPressed(sender: UIButton){
        let index = inventory.indexOf(sender)!
        if index < player.inventory.items.count {
            player.equip(player.inventory.items[index])
            updateScreen()
        }
    }
    
    @IBAction func headButtonPressed(sender: UIButton){
        if let _ = player.head{
            player.unequip(player.head!)
        }
        updateScreen()
    }

    @IBAction func chestButtonPressed(sender: UIButton){
        if let _ = player.chest{
            player.unequip(player.chest!)
        }
        updateScreen()
    }
    
    @IBAction func armsButtonPressed(sender: UIButton){
        if let _ = player.arms{
            player.unequip(player.arms!)
        }
        updateScreen()
    }
    
    @IBAction func weaponButtonPressed(sender: UIButton){
        if let _ = player.weapon{
            player.unequip(player.weapon!)
        }
        updateScreen()
    }
    
    @IBAction func legsButtonPressed(sender: UIButton){
        if let _ = player.legs{
            player.unequip(player.legs!)
        }
        updateScreen()
    }
}

