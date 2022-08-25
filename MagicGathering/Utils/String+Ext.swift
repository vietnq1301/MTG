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
