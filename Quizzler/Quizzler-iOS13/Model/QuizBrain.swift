
import Foundation

struct QuizBrain {
    let quiz = EnglishQAs().quiz

    var questionNumber = 0
    var correctAnswers = 0
    // This mutating function helps us to update the number when it called
    mutating func updateNumber() {
        
        if questionNumber + 1 < quiz.count {
            self.questionNumber += 1
        } else {
            self.questionNumber = 0
            self.correctAnswers = 0
        }
        
    }
    // I used this extra function to bring more operations into Model for better MVC design pattern
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    // This function checks if the button triggered matches with true answer
    mutating func checkAnswer(_ userAnswer : Bool) -> Bool {
        if userAnswer == quiz[questionNumber].answer {
            correctAnswers += 1
            return true
        } else {
            return false
        }
    }
    func progressUpdate() -> Float {
        return Float(questionNumber) / Float(quiz.count)
    }

    func getScore() -> String {
        return "Score: \(String(correctAnswers))"
    }

}

func boolMaker(_ stringAnswer : String) -> Bool {
/* One way is to use If-Else statement which is not performace friendly
    let boolAnswer : Bool
    if stringAnswer == "True" {
        boolAnswer = true
    } else {
        boolAnswer = false
    }
    return boolAnswer */
    
    // Better way is to rely on Swift Logic :)
    return stringAnswer == "True"
}


