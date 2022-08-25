//
//  CardImagery.swift
//  MagicGathering
//
//  Created by Nguyễn Việt on 14/07/2022.
//

import Foundation

class CardImagery: Decodable {
    init(png: String = "", borderCrop: String = "", artCrop: String = "", large: String = "", normal: String = "", small: String = "") {
        self.png = png
        self.borderCrop = borderCrop
        self.artCrop = artCrop
        self.large = large
        self.normal = normal
        self.small = small
    }
    
    var png: String = ""
    var borderCrop: String = ""
    var artCrop: String = ""
    var large: String = ""
    var normal: String = ""
    var small : String = ""
    
    enum CodingKeys: String, CodingKey {
        case png
        case borderCrop = "border_crop"
        case artCrop = "art_crop"
        case large, normal, small
    }
    
    required init() {}
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        png = try container.decodeIfPresent(String.self, forKey: .png) ?? ""
        borderCrop = try container.decodeIfPresent(String.self, forKey: .borderCrop) ?? ""
        artCrop = try container.decodeIfPresent(String.self, forKey: .artCrop) ?? ""
        large = try container.decodeIfPresent(String.self, forKey: .large) ?? ""
        normal = try container.decodeIfPresent(String.self, forKey: .normal) ?? ""
        small = try container.decodeIfPresent(String.self, forKey: .small) ?? ""
    }
}
