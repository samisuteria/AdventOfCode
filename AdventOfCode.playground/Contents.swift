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

let day1String = readFile("Day1")
Day1Part1(day1String)
Day1Part2(day1String)