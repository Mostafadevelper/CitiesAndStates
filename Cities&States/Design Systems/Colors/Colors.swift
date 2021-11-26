//
//  Colors.swift
//  Cities&States
//
//  Created by Mostafa on 26/11/2021.
//

import UIKit


enum Colors: String {
    case primary = "primary"
    case secondary = "secondary"
    case darkLine = "Header"
    case bgColor = "background"
    
    var color: UIColor {
        return UIColor(named: self.rawValue)!
    }
}

