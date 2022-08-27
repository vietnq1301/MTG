//
//  Fonts.swift
//  MagicGathering
//
//  Created by Nguyễn Việt on 27/08/2022.
//

import UIKit

extension UIFont {

    public enum OpenSansType: String {
        case bold = "OpenSans-Bold"
        case boldItalic = "OpenSans-BoldItalic"
        case extraBold = "OpenSans-ExtraBold"
        case extraboldItalic = "OpenSans-ExtraBoldItalic"
        case italic = "OpenSans-Italic"
        case light = "OpenSans-Light"
        case lightItalic = "OpenSans-LightItalic"
        case medium = "OpenSans-Medium"
        case mediumItalic = "OpenSans-MediumItalic"
        case regular = "OpenSans-Regular"
        case semiBold = "OpenSans-SemiBold"
        case semiBoldItalic = "OpenSans-SemiBoldItalic"
    }

    static func OpenSans(_ type: OpenSansType = .regular, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: type.rawValue, size: size)!
    }

    var isBold: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitBold)
    }

    var isItalic: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitItalic)
    }
    
    static var titleFont: UIFont {
        return UIFont.OpenSans(.medium, size: 18)
    }
    
    static var descriptionFont: UIFont {
        return UIFont.OpenSans(.regular, size: 16)
    }
    
    static var italicDescriptionFont: UIFont {
        return UIFont.OpenSans(.italic, size: 16)
    }
}
