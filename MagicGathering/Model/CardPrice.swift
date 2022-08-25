//
//  CardPrice.swift
//  MagicGathering
//
//  Created by Nguyễn Việt on 14/07/2022.
//

import Foundation

class CardPrice: Decodable {
    init(usd: String = "", usdFoil: String = "", usdEtched: String = "", eur: String = "", eurFoil: String = "", tix: String = "") {
        self.usd = usd
        self.usdFoil = usdFoil
        self.usdEtched = usdEtched
        self.eur = eur
        self.eurFoil = eurFoil
        self.tix = tix
    }
    
    var usd: String = ""
    var usdFoil: String = ""
    var usdEtched: String = ""
    var eur: String = ""
    var eurFoil: String = ""
    var tix: String = ""
    
    enum CodingKeys: String, CodingKey {
        case usd
        case usdFoil = "usd_foil"
        case usdEtched = "usd_etched"
        case eur
        case eurFoil = "eur_foil"
        case tix
    }
    
    required init() {}
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        usd = try container.decodeIfPresent(String.self, forKey: .usd) ?? ""
        usdFoil = try container.decodeIfPresent(String.self, forKey: .usdFoil) ?? ""
        usdEtched = try container.decodeIfPresent(String.self, forKey: .usdEtched) ?? ""
        eur = try container.decodeIfPresent(String.self, forKey: .eur) ?? ""
        eurFoil = try container.decodeIfPresent(String.self, forKey: .eurFoil) ?? ""
        tix = try container.decodeIfPresent(String.self, forKey: .tix) ?? ""
    }
}
