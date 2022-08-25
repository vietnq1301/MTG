//
//  CardPurchaseUri.swift
//  MagicGatheringUIKit
//
//  Created by Nguyễn Việt on 14/08/2022.
//

import Foundation




class CardPurchaseUri: Decodable {
    init(tcgplayer: String = "", cardmarket: String = "", cardhoarder: String = "") {
        self.tcgplayer = tcgplayer
        self.cardmarket = cardmarket
        self.cardhoarder = cardhoarder
    }
    
    var tcgplayer: String = ""
    var cardmarket: String = ""
    var cardhoarder: String = ""
    
    required init() {}
    
    enum CodingKeys: String, CodingKey {
        case tcgplayer, cardmarket, cardhoarder
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        tcgplayer = try container.decodeIfPresent(String.self, forKey: .tcgplayer) ?? ""
        cardmarket = try container.decodeIfPresent(String.self, forKey: .cardmarket) ?? ""
        cardhoarder = try container.decodeIfPresent(String.self, forKey: .cardhoarder) ?? ""
    }
}
