import Vapor

public final class SendgridEmail: Content {
    let personalizations: [Personalization]
    let from: EmailContact
    let reply_to: EmailContact?
    let subject: String
    let content: [EmailContent]
    
    public init(personalizations: [Personalization], from: EmailContact, subject: String, content: EmailContent, reply_to: EmailContact? = nil) {
        self.personalizations = personalizations
        self.from = from
        self.subject = subject
        self.content = [content]
        self.reply_to = reply_to
    }
    
    public final class EmailContent: Content {
        let type: String
        let value: String
        
        public init(type: EmailType, value: String) {
            self.type = type.rawValue
            self.value = value
        }
        
        public enum EmailType: String {
            case plainText = "text/plain"
            case html = "text/html"
        }
    }
}
