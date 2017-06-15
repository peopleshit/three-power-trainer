//
//  CustomTextField.swift
//  three-power-trainer
//
//  Created by Kirill Mayboroda on 15.06.17.
//  Copyright © 2017 Kirill Mayboroda. All rights reserved.
//

import Foundation
import UIKit

class RestrictPasteUITextField: UITextField {
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
}
