import Foundation

class Day1 {
    
    class func Part1 () -> String {
        let input = Helper.readFile("Day1")
        
        var floor = 0
        
        input.characters.forEach { (char) -> () in
            if char == "(" {
                floor++
            } else if char == ")" {
                floor--
            }
        }
        
        return "Floor: \(floor)"
    }
    
    class func Part2 () -> String {
        let input = Helper.readFile("Day1")
        
        var floor = 0
        
        for (index, char) in input.characters.enumerate() {
            if char == "(" {
                floor++
            } else if char == ")" {
                floor--
            }
            
            if floor < 0 {
                return "Floor: \(index + 1)" //since the arrays on the site start 1
            }
        }
        
        return "Error" //error
    }
}