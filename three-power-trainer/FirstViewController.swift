//
//  FirstViewController.swift
//  three-power-trainer
//
//  Created by Kirill Mayboroda on 14.06.17.
//  Copyright © 2017 Kirill Mayboroda. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    @IBOutlet weak var numberLabel: UILabel!
    private var number : Number = Number();
    private var answer : UInt32 = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.number = Number();
        self.answer = number.getNumber;
        numberLabel.text = number.getNumberToPower;
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        number.newNumber();
        numberLabel.text = number.getNumberToPower;
        answer = number.getNumber;
    }

}

