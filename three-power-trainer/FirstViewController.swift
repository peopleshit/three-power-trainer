//
//  FirstViewController.swift
//  three-power-trainer
//
//  Created by Kirill Mayboroda on 14.06.17.
//  Copyright © 2017 Kirill Mayboroda. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var answerText: UITextField!
    private var number: Number = Number();
    private var answer: UInt32 = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.number = Number()
        self.answer = number.getNumber
        numberLabel.text = number.getNumberToPower
        
        answerText.keyboardType = .numberPad;
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func generateButtonPressed(_ sender: UIButton) {
        number.newNumber()
        numberLabel.text = number.getNumberToPower
        answer = number.getNumber
    }

    @IBAction func checkButtonPressed(_ sender: UIButton) {
        if (areNumbers(answerText, shouldChangeCharactersInRange: NSRange(), replacementString: "")) {
            if (answerText.text != "empty" && UInt32(answerText.text!)! == answer) {
                numberLabel.text = "Correct!"
            }
        }
    }
    
    private func areNumbers(_ textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let invalidChars = CharacterSet(charactersIn: "0123456789").inverted
        return string.rangeOfCharacter(from: invalidChars, options: [], range: string.startIndex ..< string.endIndex) == nil
    }
}

