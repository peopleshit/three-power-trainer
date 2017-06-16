//
//  Result.swift
//  three-power-trainer
//
//  Created by Kirill Mayboroda on 16.06.17.
//  Copyright © 2017 Kirill Mayboroda. All rights reserved.
//

import Foundation

class Result {
    
    private var _result: Double
    private var _number: UInt32
    private var _group: Double
    
    init(result: Double, number: UInt32, time: UInt32) {
        _result = result
        _number = number
        let dTime = Double(time)
        if (result >= dTime) {
            _group = 0
        }
        else {
            _group = 1 - (result / dTime)
        }
    }
}
