//
//  Settings.swift
//  three-power-trainer
//
//  Created by Kirill Mayboroda on 16.06.17.
//  Copyright © 2017 Kirill Mayboroda. All rights reserved.
//

import Foundation

final class Settings {
    
    private init() { }
    
    private static let _instance = Settings()
    
    private var _time: UInt32 = 10
    
    static var instance: Settings {
        get {
            return _instance
        }
    }
    
    var time: UInt32 {
        get {
            return _time
        }
        set (newTime) {
            if (newTime > 0) {
                _time = newTime
            }
        }
    }
    
    var stringTime: String {
        get {
            return String(_time)
        }
    }
    
}
