
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreTracker: UILabel!
    
    // I imported QuizBrain inside viewController as qM instead of repeating QuizBrain() each time
    
    var qM = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // We update UI when app launches to have our first question shown
        updateUI()
        progressBar.progress = 0
        qM.questionNumber = 0
    }
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        // It's safe to force Unwrapp the currentTitle because we're sure that there are only 2 buttons and the app will not crash
        let stringAnswer = sender.currentTitle!
        // Converting String Title to Bool with our function inside the QuizBrain model
        let userAnswer = boolMaker(stringAnswer)
        

        if qM.checkAnswer(userAnswer) {
            //Again the main operation happens inside the model and if it was true viewController will change the main View
            sender.backgroundColor = UIColor.green
            // Here We Update the number to make sure seeing our next question
            qM.updateNumber()
        } else {
            sender.backgroundColor = UIColor.red
            qM.updateNumber()
        }
        
        //This code helps us having a little delay so the user can undrestand the correct answer
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    @objc func updateUI() {
        questionLabel.text = qM.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = qM.progressUpdate()
        scoreTracker.text = qM.getScore()
    }

}

