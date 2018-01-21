import Vapor

public class Sendgrid: Service {
    let client: Client
    let apiKey: String
    private let url = "https://api.sendgrid.com/v3/mail/send"
    
    public init(apiKey: String, client: Client) {
        self.apiKey = apiKey
        self.client = client
    }
    
    @discardableResult
    public func sendEmail(email: SendgridEmail) throws -> Future<Response> {
        return client.post(URI(url), headers: headers(), content: email)
    }
    
    private func headers() -> HTTPHeaders {
        return HTTPHeaders(dictionaryLiteral:
                        (.authorization, "Bearer \(apiKey)"),
                        (.contentType, "application/json"))
    }
}
