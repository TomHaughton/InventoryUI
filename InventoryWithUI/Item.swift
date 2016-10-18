import Foundation
class Item: NSObject {
    var name: String?
    var weight: Int?
    
    init(name: String, weight: Int){
        self.name = name
        self.weight = weight
    }
    
    override func isEqual(object: AnyObject?) -> Bool {
        guard let rhs = object as? Item else {
            return false
        }
        let lhs = self
        
        return lhs.name == rhs.name && lhs.weight == rhs.weight
    }
}