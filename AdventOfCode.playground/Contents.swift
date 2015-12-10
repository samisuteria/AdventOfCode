import Foundation

//Reads a file and returns the contents as a String
//Error if file not found or decoding
func readFile(fileName: String) -> String {
    let filePath = NSBundle.mainBundle().pathForResource(fileName, ofType: "txt")
    let fileData = NSFileManager.defaultManager().contentsAtPath(filePath!)
    let fileContent = NSString(data: fileData!, encoding: NSUTF8StringEncoding)
        
    return String(fileContent!)
}

//Day 1

func Day1Part1(input: String) -> Int {
    var floor = 0
    
    input.characters.forEach { (char) -> () in
        if char == "(" {
            floor++
        } else if char == ")" {
            floor--
        }
    }
    
    return floor
}

func Day1Part2(input: String) -> Int {
    var floor = 0
    
    for (index, char) in input.characters.enumerate() {
        if char == "(" {
            floor++
        } else if char == ")" {
            floor--
        }
        
        if floor < 0 {
            return index + 1 //since the arrays on the site start 1
        }
    }
    
    return 0 //error
}

//let day1String = readFile("Day1")
//Day1Part1(day1String)
//Day1Part2(day1String)

//Day 2

typealias Dimensions = (length: Int, width: Int, height: Int)

func Day2StringToDimensions(input: String) -> [Dimensions] {
    var presents = [Dimensions]()
    
    let listOfPresentDimensions = input.componentsSeparatedByString("\n")
    
    listOfPresentDimensions.forEach { (presentString) -> () in
        let presentValues = presentString.componentsSeparatedByString("x")
        let present = Dimensions(length: Int(presentValues[0])!, width: Int(presentValues[1])!, height: Int(presentValues[2])!)
        presents.append(present)
    }
    
    return presents
}

func Day2Part1(input: String) -> Int {
    
    let presents = Day2StringToDimensions(input)
    
    var total = 0
    
    presents.forEach { (present) -> () in
        
        let side1 = present.length*present.width
        let side2 = present.width*present.height
        let side3 = present.height*present.length
        
        total = total + 2*(side1 + side2 + side3)
        
        total = total + min(side1, side2, side3)
    }
    
    return total
}

func Day2Part2(input: String) -> Int {
    
    let presents = Day2StringToDimensions(input)
    
    var total = 0
    
    presents.forEach { (present) -> () in
        let perimeter1 = 2*(present.length + present.width)
        let perimeter2 = 2*(present.length + present.height)
        let perimeter3 = 2*(present.width + present.height)
        
        total = total + min(perimeter1, perimeter2, perimeter3) + present.height*present.width*present.length
        
    }
    
    return total
}

//let day2String = readFile("Day2")
//Day2Part1(day2String)
//Day2Part2(day2String)

//Day 3

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

func Day3Part1(input: String) -> Int {
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
    
    return HousesVisited.count
}

func Day3Part2(input: String) -> Int {
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
    
    return HousesVisited.count
}

//let day3String = readFile("Day3")
//Day3Part1(day3String)
//Day3Part2(day3String)


