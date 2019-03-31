//
//  GameViewController.swift
//  CopyKakaoTalk
//
//  Created by YooBin Jo on 19/03/2019.
//  Copyright © 2019 YooBin Jo. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var score: Int = 0
    var timer: Timer?
    var seconds: Int = 60
    
    @IBOutlet weak var scoreLabel: UILabel?
    @IBOutlet weak var numberLabel: UILabel?
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField?

    @IBAction func closeButton(_ sender: Any) {
        self.closeView()
    }
    func makeRandomNumber() -> String {
        var result: String = ""
        for _ in 1...4 {
            var digit: Int = Int(arc4random_uniform(8) + 1)
            result += "\(digit)"
        }
        return result
    }
    func makeRandomRuleNumber() -> String {
        var result: String = ""
        for _ in 1...4 {
            var digit: Int = Int(arc4random_uniform(1) + 1)
            result += "\(digit)"
        }
        return result
    }
    
    
    func updateScore() {
        scoreLabel?.text = "\(score)"
    }
    func updateTimerLabel() -> Void {
        if timerLabel != nil {
            let min: Int = (seconds / 60) % 60
            let sec: Int = seconds % 60
            
            let min_p: String = String(format: "%02d", min)
            let sec_p: String = String(format: "%02d", sec)
            
            timerLabel!.text = "\(min_p):\(sec_p)"
        }
    }
    func setRandomNumber() {
        numberLabel?.text = makeRandomNumber()
    }
    func closeView() {
        dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setRandomNumber()
        self.updateScore()

        
        inputTextField?.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(showScreenSaverVC), name: UIApplication.willResignActiveNotification, object: nil)
    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        let flagNumber = Int(makeRandomRuleNumber())
        if inputTextField?.text?.characters.count ?? 0 < 4 {
            return
        }
        if let numbersText = numberLabel?.text,
            let inputText = inputTextField?.text,
            let numbers = Int(numbersText),
            let input = Int(inputText) {
            print(flagNumber!)
            print("Comparing : \(inputText) minus \(numbersText) == \(input - numbers)")
            if(input - numbers == flagNumber) {
                print("Correct!")
                score += 1
                self.updateScore()
                self.setRandomNumber()
            } else {
                print("Incorrect!")
                score -= 1
            }
        }
        self.updateScore()
        
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }
    @objc func updateTimer() {
        if seconds > 0 && seconds <= 60 {
            seconds -= 1
            self.updateTimerLabel()
        } else if seconds == 0 {
            if timer != nil {
                timer?.invalidate()
                timer = nil
                
                let alert = UIAlertController(title: "Time UP!!", message: "시간이 초과되었습니다!!\n당신의 점수는 \(score)점 입니다.", preferredStyle: .alert)
                let restart = UIAlertAction(title: "다시하기", style: .default, handler: nil)
                let cancel = UIAlertAction(title: "닫기", style: .cancel, handler: {action in self.closeView()})
                alert.addAction(restart)
                alert.addAction(cancel)
                
                self.present(alert, animated: true, completion: nil)
                
                score = 0
                seconds = 60
                
                self.updateTimerLabel()
                self.updateScore()
                self.makeRandomNumber()
                
            }
        }
    }
    
    @objc func showScreenSaverVC() {
        let screenSaverVC = ScreenSaverViewController()
        present(screenSaverVC, animated: false, completion: {
            //something do here
        })
    }
}
