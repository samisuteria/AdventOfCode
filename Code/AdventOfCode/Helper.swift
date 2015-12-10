import Foundation

class Helper {
    class func readFile(fileName: String) -> String {
        
        var outputString = ""
        
        guard let filePath = NSBundle.mainBundle().pathForResource(fileName, ofType: "txt") else {
            outputString = "Could Not Find Path"
            return outputString
        }
        
        guard let fileData = NSFileManager.defaultManager().contentsAtPath(filePath) else {
            outputString = "Could Not Read Data"
            return outputString
        }
        
        guard let fileContent = NSString(data: fileData, encoding: NSUTF8StringEncoding) else {
            outputString = "Could Not Get File Contents"
            return outputString
        }
        
        outputString = String(fileContent)
        
        return outputString
    }
}