//
//  Number.swift
//  three-power-trainer
//
//  Created by Kirill Mayboroda on 14.06.17.
//  Copyright © 2017 Kirill Mayboroda. All rights reserved.
//

import Foundation

class Number {
    
    init() {
        self.number = self.generateNumber();
    }
    
    private var number : UInt32 = 0;
    
    var getNumberToPower : String {
        get {
            return String(pow(num: self.number));
        }
    }
    
    var getNumber : UInt32 {
        get {
            return self.number;
        }
    }
    
    private func generateNumber() -> UInt32 {
        var n = arc4random_uniform(100);
        if (n == 0) {
            n = self.generateNumber();
        }
        return n;
    }
    
    func newNumber() {
        self.number = self.generateNumber();
    }
    
    private func pow(num : UInt32) -> UInt32 {
        let number : Double = Darwin.pow(Double(num), 3.0);
        return UInt32(number);
    }
}
