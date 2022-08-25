//
//  CardRelatedUri.swift
//  MagicGatheringUIKit
//
//  Created by Nguyễn Việt on 14/08/2022.
//

import Foundation

class CardRelatedUri: Decodable {
    internal init(gatherer: String = "", tcgplayerInfiniteArticles: String = "", tcgplayerInfiniteDecks: String = "", edhrec: String = "") {
        self.gatherer = gatherer
        self.tcgplayerInfiniteArticles = tcgplayerInfiniteArticles
        self.tcgplayerInfiniteDecks = tcgplayerInfiniteDecks
        self.edhrec = edhrec
    }
    
    var gatherer: String = ""
    var tcgplayerInfiniteArticles: String = ""
    var tcgplayerInfiniteDecks: String = ""
    var edhrec: String = ""
    
    enum CodingKeys: String, CodingKey {
        case gatherer
        case tcgplayerInfiniteArticles = "tcgplayer_infinite_articles"
        case tcgplayerInfiniteDecks = "tcgplayer_infinite_decks"
        case edhrec
    }

    required init() {}
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        gatherer = try container.decodeIfPresent(String.self, forKey: .gatherer) ?? ""
        tcgplayerInfiniteArticles = try container.decodeIfPresent(String.self, forKey: .tcgplayerInfiniteArticles) ?? ""
        tcgplayerInfiniteDecks = try container.decodeIfPresent(String.self, forKey: .tcgplayerInfiniteDecks) ?? ""
        edhrec = try container.decodeIfPresent(String.self, forKey: .edhrec) ?? ""
    }
}
