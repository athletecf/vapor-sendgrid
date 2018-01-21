import Vapor

public final class SendgridProvider: Provider {
    public static var repositoryName = "vapor-sendgrid"
    
    let apiKey: String
    
    public init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    public func register(_ services: inout Services) throws {
        services.register(Sendgrid.self) { container -> Sendgrid in
            let client = try container.make(Client.self, for: Sendgrid.self)
            return Sendgrid(apiKey: self.apiKey, client: client)
        }
    }
    
    public func boot(_ worker: Container) throws { }
}
