import Vapor

public final class Personalization: Content {
    
    let toAddresses: [EmailContact]
    
    init(toAddresses: [EmailContact]) {
        self.toAddresses = toAddresses
    }
    
    enum CodingKeys: String, CodingKey {
        case toAddresses = "to"
    }
}

public final class EmailContact: Content {
    let email: String
    let name: String?
    
    init(email: String, name: String? = nil) {
        self.email = email
        self.name = name
    }
}
