//
//  String+Ext.swift
//  MagicGathering
//
//  Created by Nguyễn Việt on 10/07/2022.
//

import UIKit

extension String {
    func toSymbol() -> NSMutableAttributedString {
        let regex = "\\{[^}]*\\}"
        let mana = self
        let attributedString = NSMutableAttributedString(string: mana)
        let symbols = matches(for: regex, in: mana)
        for symbol in symbols {
            var sym = symbol
            sym = sym.replacingOccurrences(of: "{", with: "")
            sym = sym.replacingOccurrences(of: "}", with: "")
            sym = sym.replacingOccurrences(of: "/", with: "")
            sym = sym.replacingOccurrences(of: "½", with: "HALF")
            let uiimage  = UIImage(named: sym)
            let attachment = NSTextAttachment()
            attachment.image = uiimage
            attachment.bounds = CGRect(x: 0, y: -2, width: 16, height: 16)
            let replacement = NSAttributedString(attachment: attachment)
            let range = attributedString.string.range(of: symbol)
            if let range = range {
                let nsRange = NSRange(range, in: attributedString.string)
                attributedString.replaceCharacters(in: nsRange, with: replacement)
            }

        }
        return attributedString
    }
}

extension NSMutableAttributedString {
    func addItalic(of string : String)  {
        let subString = string
        let newAttributedString = NSMutableAttributedString(
            string: subString,
            attributes: [
                NSAttributedString.Key.font: UIFont.italicDescriptionFont,
            ]
        )
        
        let range = self.string.range(of: string)
        if let range = range {
            let nsRange = NSRange(range, in: self.string)
            self.replaceCharacters(in: nsRange, with: newAttributedString)
        }
    }
    
    func addItalic() {
        let regex = "\\((.*?)\\)"
        let text = self.string
        let italicTexts = matches(for: regex, in: text)
        for italicText in italicTexts {
            addItalic(of: italicText)
        }
    }
    
    func toSymbol() {
        let regex = "\\{[^}]*\\}"
        let mana = self.string
        let symbols = matches(for: regex, in: mana)
        for symbol in symbols {
            var sym = symbol
            sym = sym.replacingOccurrences(of: "{", with: "")
            sym = sym.replacingOccurrences(of: "}", with: "")
            sym = sym.replacingOccurrences(of: "/", with: "")
            sym = sym.replacingOccurrences(of: "½", with: "HALF")
            let uiimage  = UIImage(named: sym)
            let attachment = NSTextAttachment()
            attachment.image = uiimage
            attachment.bounds = CGRect(x: 0, y: -3, width: 15, height: 15)
            let replacement = NSAttributedString(attachment: attachment)
            let range = self.string.range(of: symbol)
            if let range = range {
                let nsRange = NSRange(range, in: self.string)
                self.replaceCharacters(in: nsRange, with: replacement)
            }
        }
    }
    
    func bold(string: String) {
        let subString = string
        let newAttributedString = NSMutableAttributedString(
            string: subString,
            attributes: [
                NSAttributedString.Key.font: UIFont.OpenSans(.bold, size: 16),
            ]
        )
        
        let range = self.string.range(of: string)
        if let range = range {
            let nsRange = NSRange(range, in: self.string)
            self.replaceCharacters(in: nsRange, with: newAttributedString)
        }
    }
}
