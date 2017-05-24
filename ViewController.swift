//
//  ViewController.swift
//  Project 2
//
//  Created by CGY-IMAC-101 on 2016-11-22.
//  Copyright © 2016 CGY-IMAC-101. All rights reserved.
//

import GameplayKit
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var correctAnswerCt: UILabel!
    @IBOutlet weak var incorrectAnswerCt: UILabel!

    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var correctCount = 0
    var incorrectCount = 0

    @IBAction func reset2(_ sender: Any) {
        let title: String = " Game Reset"
        score = 0
        correctCount = 0
        incorrectCount = 0
        
        self.correctAnswerCt.text = "Correct: \(correctCount)"
        self.incorrectAnswerCt.text = "Incorrect: \(incorrectCount)"
        self.correctAnswerCt.adjustsFontSizeToFitWidth = true
        self.incorrectAnswerCt.adjustsFontSizeToFitWidth = true
        
        let ac = UIAlertController(title: title, message: "Your Score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        self.correctAnswerCt.text = "Correct: \(correctCount)"
        self.incorrectAnswerCt.text = "Incorrect: \(incorrectCount)"
        self.correctAnswerCt.adjustsFontSizeToFitWidth = true
        self.incorrectAnswerCt.adjustsFontSizeToFitWidth = true
        
        askQuestion(action: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func askQuestion(action: UIAlertAction!){
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        title = countries[correctAnswer].uppercased()  

    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if(correctAnswer == sender.tag){
            title = "Correct"
            score += 1
            correctCount += 1
            self.correctAnswerCt.text = "Correct: \(correctCount)"
            self.correctAnswerCt.adjustsFontSizeToFitWidth = true
        }else{
            title = "Incorrect you Idiot!!"
            score -= 1
            incorrectCount += 1
            self.incorrectAnswerCt.text = "Incorrect: \(incorrectCount)"
            self.incorrectAnswerCt.adjustsFontSizeToFitWidth = true
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

