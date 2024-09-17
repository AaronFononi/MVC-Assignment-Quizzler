
import Foundation

struct Question {
    let text : String
    let answer : Bool
    
    init(q: String, a: Bool) {
        text = q
        answer = a
    }
}
