import Foundation

class Day2 {
    
    private typealias Dimensions = (length: Int, width: Int, height: Int)
    
    class func Part1 () -> String {
        let input = Helper.readFile("Day2")
        
        let presents = Day2StringToDimensions(input)
        
        var total = 0
        
        presents.forEach { (present) -> () in
            
            let side1 = present.length*present.width
            let side2 = present.width*present.height
            let side3 = present.height*present.length
            
            total = total + 2*(side1 + side2 + side3)
            
            total = total + min(side1, side2, side3)
        }
        
        return "Wrapping Paper: \(total) sqft"
    }
    
    class func Part2 () -> String {
        let input = Helper.readFile("Day2")
        
        let presents = Day2StringToDimensions(input)
        
        var total = 0
        
        presents.forEach { (present) -> () in
            let perimeter1 = 2*(present.length + present.width)
            let perimeter2 = 2*(present.length + present.height)
            let perimeter3 = 2*(present.width + present.height)
            
            total = total + min(perimeter1, perimeter2, perimeter3) + present.height*present.width*present.length
            
        }
        
        return "Ribbon: \(total) ft"
    }
    
    private class func Day2StringToDimensions(input: String) -> [Dimensions] {
        var presents = [Dimensions]()
        
        let listOfPresentDimensions = input.componentsSeparatedByString("\n")
        
        listOfPresentDimensions.forEach { (presentString) -> () in
            let presentValues = presentString.componentsSeparatedByString("x")
            let present = Dimensions(length: Int(presentValues[0])!, width: Int(presentValues[1])!, height: Int(presentValues[2])!)
            presents.append(present)
        }
        
        return presents
    }
}