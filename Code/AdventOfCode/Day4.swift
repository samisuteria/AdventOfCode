import Foundation

class Day4 {
    
    class func Part1() -> String {
        
        let input = "iwrupvqb"
        var answer: Int = 0
        
        while(true){
            answer++
            let hex = Day4.md5("\(input)\(String(answer))")
            if hex.hasPrefix("00000") {
                return String(answer)
            }
        }
    }
    
    class func Part2() -> String {
        let input = "iwrupvqb"
        var answer: Int = 0
        var hex = ""
        
        while(true){
            answer++
            hex = Day4.md5("\(input)\(String(answer))")
            if hex.hasPrefix("000000") {
                return String(answer)
            }
        }
    }
    
    private class func md5(input: String) -> String {
        var digest = [UInt8](count: Int(CC_MD5_DIGEST_LENGTH), repeatedValue: 0)
        if let data = input.dataUsingEncoding(NSUTF8StringEncoding) {
            CC_MD5(data.bytes, CC_LONG(data.length), &digest)
        }
        
        var digestHex = ""
        for index in 0..<Int(CC_MD5_DIGEST_LENGTH) {
            digestHex += String(format: "%02x", digest[index])
        }
        return digestHex
    }
}