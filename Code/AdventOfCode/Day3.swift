import Foundation

class Day3 {
    
    class func Part1 () -> String {
        let input = Helper.readFile("Day3")
        
        var HousesVisited = Set<House>()
        
        var currentHouse = House(x: 0, y: 0)
        HousesVisited.insert(currentHouse)
        
        input.characters.forEach { (char) -> () in
            
            switch char {
            case "^":
                currentHouse = House(x: currentHouse.x, y: currentHouse.y + 1)
            case "v":
                currentHouse = House(x: currentHouse.x, y: currentHouse.y - 1)
            case ">":
                currentHouse = House(x: currentHouse.x + 1, y: currentHouse.y)
            case "<":
                currentHouse = House(x: currentHouse.x - 1, y: currentHouse.y)
            default:
                break
            }
            
            HousesVisited.insert(currentHouse)
        }
        
        return "Houses Visited by Santa: \(HousesVisited.count)"
    }
    
    class func Part2 () -> String {
        let input = Helper.readFile("Day3")
        
        var HousesVisited = Set<House>()
        
        var santaCurrentHouse = House(x: 0, y: 0)
        var roboSantaCurrentHouse = House(x: 0, y: 0)
        var currentHouse = House(x: 0, y: 0)
        
        HousesVisited.insert(currentHouse)
        
        var santasTurn = true
        
        input.characters.forEach { (char) -> () in
            
            currentHouse = santasTurn ? santaCurrentHouse : roboSantaCurrentHouse
            
            switch char {
            case "^":
                currentHouse = House(x: currentHouse.x, y: currentHouse.y + 1)
            case "v":
                currentHouse = House(x: currentHouse.x, y: currentHouse.y - 1)
            case ">":
                currentHouse = House(x: currentHouse.x + 1, y: currentHouse.y)
            case "<":
                currentHouse = House(x: currentHouse.x - 1, y: currentHouse.y)
            default:
                break
            }
            
            HousesVisited.insert(currentHouse)
            
            if santasTurn {
                santaCurrentHouse = currentHouse
            } else {
                roboSantaCurrentHouse = currentHouse
            }
            
            santasTurn = !santasTurn
        }
        
        return "Houses visited by Santa and Robo Santa: \(HousesVisited.count)"
    }
}

struct House: Hashable {
    let x: Int
    let y: Int
    
    var hashValue : Int {
        get {
            return "\(self.x),\(self.y)".hashValue
        }
    }
}

func == (lhs: House, rhs: House) -> Bool {
    return (lhs.x == rhs.x) && (lhs.y == rhs.y)
}