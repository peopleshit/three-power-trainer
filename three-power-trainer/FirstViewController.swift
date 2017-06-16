//
//  FirstViewController.swift
//  three-power-trainer
//
//  Created by Kirill Mayboroda on 14.06.17.
//  Copyright © 2017 Kirill Mayboroda. All rights reserved.
//

import UIKit
import AudioToolbox

class FirstViewController: UIViewController {

    
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var answerBox: RestrictPasteUITextField!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var startStopButton: UIButton!
    private var number: Number = Number()
    private var answer: UInt32 = 0
    private var countdown = Timer()
    private var answerTimer = Timer()
    private var time: UInt32 = 0
    private let settings: Settings = Settings.instance
    private var state: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.number = Number()
        time = settings.time
        checkButton.isEnabled = false
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(self.didTapView))
        self.view.addGestureRecognizer(tapRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func startStopButtonPressed(_ sender: UIButton) {
        if (state) {
            stop()
        }
        else {
            start()
        }
    }

    @IBAction func checkButtonPressed(_ sender: UIButton) {
        let result = answerBox.text
        if (areNumbers(answerBox, shouldChangeCharactersInRange: NSRange(), replacementString: "")) {
            answerBox.text = ""
            if (result != "" && UInt32(result!)! == answer) {
                correct()
            }
            else {
                incorrect()
            }
        }
    }
    
    private func stop() {
        state = false
        checkButton.isEnabled = false
        numberLabel.text = "0"
        countdown.invalidate()
        timerLabel.text = "Time: " + settings.stringTime
        startStopButton.setTitle("Start", for: .normal)
        
    }
    
    @objc private func timerTick() {
        time -= 1
        timerLabel.text = "Time: " + String(time)
        if (time == 0) {
            countdown.invalidate()
            timeout()
        }
    }
    
    @objc private func new() {
        number.newNumber()
        numberLabel.textColor = UIColor.black
        numberLabel.text = number.getNumberToPower
        answer = number.getNumber
        timerLabel.text = "Time: " + settings.stringTime
        time = 10
        countdown = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerTick), userInfo: nil, repeats: true)
    }
    
    private func start() {
        new()
        state = true
        checkButton.isEnabled = true
        time = settings.time
        startStopButton.setTitle("Stop", for: .normal)
    }
    
    private func correct() {
        numberLabel.text = "Correct!"
        countdown.invalidate()
        answerTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(new), userInfo: nil, repeats: false)
    }
    
    private func incorrect() {
        numberLabelToIncorrect()
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        answerTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(numberLabelToDefault), userInfo: nil, repeats: false)
    }
    
    private func timeout() {
        numberLabelToIncorrect()
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        answerTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(new), userInfo: nil, repeats: false)
    }
    
    private func numberLabelToIncorrect() {
        numberLabel.textColor = UIColor.red
        numberLabel.text = "Incorrect!"
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
    }
    
    @objc private func numberLabelToDefault() {
        numberLabel.textColor = UIColor.black
        numberLabel.text = number.getNumberToPower
    }
    
    private func areNumbers(_ textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let invalidChars = CharacterSet(charactersIn: "0123456789").inverted
        return string.rangeOfCharacter(from: invalidChars, options: [], range: string.startIndex ..< string.endIndex) == nil
    }
    
    func didTapView(){
        self.view.endEditing(true)
    }
}

