import Vapor

public final class SendgridEmail: Content {
    let personalizations: [Personalization]
    let from: EmailContact
    let reply_to: EmailContact?
    let subject: String
    
    init(personalizations: [Personalization], from: EmailContact, subject: String, reply_to: EmailContact? = nil) {
        self.personalizations = personalizations
        self.from = from
        self.subject = subject
        self.reply_to = reply_to
    }
    
    public final class EmailContent: Content {
        let type: String
        let value: String
        
        enum EmailType: String {
            case plainText = "text/plain"
            case html = "text/html"
        }
    }
}
