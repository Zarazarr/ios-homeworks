//
//  Main.swift
//  DZ-1.3-Navigation
//
//  Created by Denis Zozulya on 22.02.2023.
//

import Foundation
import UIKit

var isLoggedIn = false

var testCounter = 0

var testString = "Тест"

extension UIColor {
    
    // Setup custom colours we can use throughout the app using hex values
    static let seemuBlue = UIColor(hex: 0x00adf7)
    static let youtubeRed = UIColor(hex: 0xf80000)
    static let dzCustomColor1 = UIColor(hex: 0x4885CC)
    
    
    // Create a UIColor from RGB
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
    
    // Create a UIColor from a hex value (E.g 0x000000)
    convenience init(hex: Int, a: CGFloat = 1.0) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF,
            a: a
        )
    }
}

extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}
