//
//  CardFace.swift
//  MagicGathering
//
//  Created by Nguyễn Việt on 14/07/2022.
//

import Foundation
import UIKit

class CardFace: Decodable, Identifiable {
    var artist: String = ""
    var cmc: Double = -1
    var colorIndicator: [String] = []
    var colors: [String] = []
    var flavorText: String = ""
    var illustrationId: String = ""
    var imageUris: CardImagery = CardImagery()
    var layout: String = ""
    var loyalty: String = ""
    var manaCost: String = ""
    var name: String = ""
    var object: String = ""
    var oracleId: String = ""
    var oracleText: String = ""
    var power: String = ""
    var printedName: String = ""
    var printedText: String = ""
    var printedTypeLine: String = ""
    var toughness: String = ""
    var typeLine: String = ""
    var watermark: String = ""
    
    enum CodingKeys: String, CodingKey {
        case artist
        case cmc
        case colorIndicator = "color_indicator"
        case colors
        case flavorText = "flavor_text"
        case illustrationId = "illustration_id"
        case imageUris = "image_uris"
        case layout, loyalty
        case manaCost = "mana_cost"
        case name
        case object
        case oracleId = "oracle_id"
        case oracleText = "oracle_text"
        case power
        case printedName = "printed_name"
        case printedText = "printed_text"
        case printedTypeLine = "printed_type_line"
        case toughness
        case typeLine = "type_line"
        case watermark
    }
    
    required init() {}
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        artist = try container.decodeIfPresent(String.self, forKey: .artist) ?? ""
        cmc = try container.decodeIfPresent(Double.self, forKey: .cmc) ?? -1
        colorIndicator = try container.decodeIfPresent([String].self, forKey: .colorIndicator) ?? []
        colors = try container.decodeIfPresent([String].self, forKey: .colors) ?? []
        flavorText = try container.decodeIfPresent(String.self, forKey: .flavorText) ?? ""
        illustrationId = try container.decodeIfPresent(String.self, forKey: .illustrationId) ?? ""
        imageUris = try container.decodeIfPresent(CardImagery.self, forKey: .imageUris) ?? CardImagery()
        layout = try container.decodeIfPresent(String.self, forKey: .layout) ?? ""
        loyalty = try container.decodeIfPresent(String.self, forKey: .loyalty) ?? ""
        manaCost = try container.decodeIfPresent(String.self, forKey: .manaCost) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        object = try container.decodeIfPresent(String.self, forKey: .object) ?? ""
        oracleId = try container.decodeIfPresent(String.self, forKey: .oracleId) ?? ""
        oracleText = try container.decodeIfPresent(String.self, forKey: .oracleText) ?? ""
        power = try container.decodeIfPresent(String.self, forKey: .power) ?? ""
        printedName = try container.decodeIfPresent(String.self, forKey: .printedName) ?? ""
        printedText = try container.decodeIfPresent(String.self, forKey: .printedText) ?? ""
        printedTypeLine = try container.decodeIfPresent(String.self, forKey: .printedTypeLine) ?? ""
        toughness = try container.decodeIfPresent(String.self, forKey: .toughness) ?? ""
        typeLine = try container.decodeIfPresent(String.self, forKey: .typeLine) ?? ""
        watermark = try container.decodeIfPresent(String.self, forKey: .watermark) ?? ""
        
    }
}

extension CardFace {
    func addSymbol() -> NSMutableAttributedString {
        let regex = "\\{[^}]*\\}"
        let mana = self.manaCost
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
