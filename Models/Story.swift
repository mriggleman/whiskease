import Foundation

struct Story: Identifiable, Codable {
    let id: Int
    let text: String
    let choices: [Choice]
    let imageName: String?
    let isEndpoint: Bool
    let category: WhiskeyCategory?
    
    struct Choice: Identifiable, Codable {
        let id: Int
        let text: String
        let destination: Int
        
        var isValid: Bool {
            text != "N/A"
        }
    }
}

enum WhiskeyCategory: String, Codable {
    case bourbon = "Bourbon"
    case rye = "Rye"
    case scotch = "Scotch"
    case irish = "Irish"
    case speyside = "Speyside"
    case highland = "Highland"
    case islay = "Islay"
    case smooth = "Smooth"
}
