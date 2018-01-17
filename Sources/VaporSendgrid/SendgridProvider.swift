import Vapor

public final class SendgridProvider: Provider {
    public static var repositoryName = "vapor-sendgrid"
    
    let apiKey: String
    
    public init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    public func register(_ services: inout Services) throws {
        services.register(Sendgrid(apiKey: apiKey))
    }
    
    public func boot(_ worker: Container) throws { }
}
