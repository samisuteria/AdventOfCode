import Foundation

//Reads a file and returns the contents as a String
//Error if file not found or decoding
func readFile(fileName: String) -> String {
    let filePath = NSBundle.mainBundle().pathForResource(fileName, ofType: "txt")
    let fileData = NSFileManager.defaultManager().contentsAtPath(filePath!)
    let fileContent = NSString(data: fileData!, encoding: NSASCIIStringEncoding)
        
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

struct Dimensions {
    let length: Int
    let width: Int
    let height: Int
}

func Day2StringToDimensions(input: String) -> [Dimensions] {
    var presents = [Dimensions]()
    
    let listOfPresentDimensions = day2String.componentsSeparatedByString("\n")
    
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
    let presents = Day2StringToDimensions(day2String)
    
    var total = 0
    
    presents.forEach { (present) -> () in
        let perimeter1 = 2*(present.length + present.width)
        let perimeter2 = 2*(present.length + present.height)
        let perimeter3 = 2*(present.width + present.height)
        
        total = total + min(perimeter1, perimeter2, perimeter3) + present.height*present.width*present.length
        
    }
    
    return total
}

let day2String = readFile("Day2")
Day2Part1(day2String)
Day2Part2(day2String)
