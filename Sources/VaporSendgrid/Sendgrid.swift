import Vapor

public class Sendgrid: Service {
    let apiKey: String
    private let url = "https://api.sendgrid.com/v3/mail/send"
    
    init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    @discardableResult
    func sendEmail(email: SendgridEmail, request: Request) throws -> Future<Response> {
        let engineClient = try request.make(EngineClient.self)
        return engineClient.post(URI(url), headers: headers(), content: email)
    }
    
    private func headers() -> HTTPHeaders {
        return HTTPHeaders(dictionaryLiteral:
                        (.authorization, "Bearer \(apiKey)"),
                        (.contentType, "application/json"))
    }
}
