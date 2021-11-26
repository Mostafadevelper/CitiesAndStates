//
//  UIFont+ extension.swift
//  Cities&States
//
//  Created by Mostafa on 26/11/2021.
//


import Foundation
import UIKit

enum Font: String {
    
    case regular = "NeoSansW23"
    case demiBold = "NeoSansW23-Medium"
    case light = "NeoSansW23-Light"
    case bold = "NeoSansW23-Bold"
    
    var name: String { self.rawValue }
}

enum FontSize: CGFloat {
    
    case size_m = 14
    case size_l = 16
    case size_xl = 17
    case size_2xl = 20
    
    var size: CGFloat {
        if  (UIDevice.current.userInterfaceIdiom == .pad) {
            return self.rawValue * 2
        }
        return self.rawValue
    }
}

extension UIFont {
    
    class func fonts(name: Font , size: FontSize) -> UIFont {
        return UIFont(name: name.name, size: size.size) ?? UIFont()
    }
}
