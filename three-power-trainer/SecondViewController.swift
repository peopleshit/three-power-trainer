//
//  SecondViewController.swift
//  three-power-trainer
//
//  Created by Kirill Mayboroda on 14.06.17.
//  Copyright © 2017 Kirill Mayboroda. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var timerSlider: UISlider!
    @IBOutlet var timerLabel: UILabel!
    private let settings: Settings = Settings.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let value = UInt32(timerSlider.value)
        timerLabel.text = String(value)
        settings.time = value
    }
    
}

