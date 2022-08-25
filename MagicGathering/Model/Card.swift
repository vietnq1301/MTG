//
//  Card.swift
//  MagicGathering
//
//  Created by Nguyễn Việt on 26/06/2022.
//

import UIKit
class Card: Decodable {
    
    required init() {}
    // Core Fields
    var arenaId: Int = -1
    var id: String = ""
    var lang: String = ""
    var mtgoId: Int = -1
    var mtgoFoilId: Int = -1
    var multiverseId: [Int] = []
    var tcgplayerId: Int = -1
    var tcgplayerEtchedId: Int = -1
    var cardmarketId: Int = -1
    var object: String = ""
    var oracleId: String = ""
    var printsSearchUri: String = ""
    var rulingsUri: String = ""
    var scryfallUri: String = ""
    var uri: String = ""
    
    // Gameplay Fields
    var allParts: [RelatedCard] = []
    var cardFaces: [CardFace] = []
    var cmc: Double = -1
    var colorIdentity: [String] = []
    var colorIndicator: [String] = []
    var colors: [String] = []
    var edhrecRank: Int = -1
    var handModifier: String = ""
    var keywords: [String] = []
    var layout: String = ""
    var legalities: CardLegality = CardLegality()
    var lifeModifier: String = ""
    var loyalty: String = ""
    var manaCost: String = ""
    var name: String = ""
    var oracleText: String = ""
    var oversized: Bool = false
    var pennyRank: Int = -1
    var power: String = ""
    var producedMana: [String] = []
    var reserved: Bool = false
    var toughness: String = ""
    var typeLine: String = ""
    
    // Print Fields
    
    var artist: String = "defaut"
    var booster: Bool = false
    var borderColor: String = ""
    var cardBackId: String = ""
    var collectorNumber: String = ""
    var contentWarning: Bool = false
    var digital: Bool = false
    var finishes: [String] = []
    var flavorName: String = ""
    var flavorText: String = ""
    var frameEffect: [String] = []
    var frame: String = ""
    var fullArt: Bool = false
    var games: [String] = []
    var highresImage: Bool = false
    var illustrationId: String = ""
    var imageStatus: String = ""
    var imageUris: CardImagery = CardImagery()
    var prices: CardPrice = CardPrice()
    var printedName: String = ""
    var printedText: String = ""
    var printedTypeLine: String = ""
    var promo: Bool = false
    var promoTypes: [String] = []
    var purchaseUris: CardPurchaseUri = CardPurchaseUri()
    var rarity: String = ""
    var relatedUris: CardRelatedUri = CardRelatedUri()
    var releasedAt: String = ""
    var reprint: Bool = false
    var scryfallSetUri: String = ""
    var setName: String = ""
    var setSearchUri: String = ""
    var setType: String = ""
    var setUri: String = ""
    var set: String = ""
    var setId: String = ""
    var storySpotlight: Bool = false
    var textless: Bool = false
    var variation: Bool = false
    var variationOf: String = ""
    var securityStamp: String = ""
    var watermark: String = ""
    
    var isFlipped = false
    
    enum CodingKeys: String, CodingKey {
        // Core
        case arenaId = "arena_id"
        case id
        case lang
        case mtgoId = "mtgo_id"
        case mtgoFoilId = "mtgo_foil_id"
        case multiverseId =  "multiverse_ids"
        case tcgplayerId = "tcgplayer_id"
        case tcgplayerEtchedId = "tcgplayer_etched_id"
        case cardmarketId = "cardmarket_id"
        case object
        case oracleId = "oracle_id"
        case printsSearchUri = "prints_search_uri"
        case rulingsUri = "rulings_uri"
        case scryfallUri = "scryfall_uri"
        case uri
        
        // Gameplay
        case allParts = "all_parts"
        case cardFaces = "card_faces"
        case cmc
        case colorIdentity = "color_identity"
        case colorIndicator = "color_indicator"
        case colors
        case edhrecRank = "edhrec_rank"
        case handModifier = "hand_modifier"
        case keywords
        case layout
        case legalities
        case lifeModifier = "life_modifier"
        case loyalty
        case manaCost = "mana_cost"
        case name
        case oracleText = "oracle_text"
        case oversized
        case pennyRank = "penny_rank"
        case power
        case producedMana = "produced_mana"
        case reserved
        case toughness
        case typeLine = "type_line"
        
        // Print Fields
        case artist
        case booster
        case borderColor = "border_color"
        case cardBackId = "cardBackId"
        case collectorNumber = "collector_number"
        case contentWarning = "content_warning"
        case digital
        case finishes
        case flavorName = "flavor_name"
        case flavorText = "flavor_text"
        case frameEffect = "frame_effect"
        case frame
        case fullArt = "full_art"
        case games
        case highresImage = "highres_image"
        case illustrationId = "illustration_id"
        case imageStatus = "image_status"
        case imageUris = "image_uris"
        case prices
        case printedName = "printed_name"
        case printedText = "printed_text"
        case printedTypeLine = "printed_type_line"
        case promo
        case promoTypes = "promo_types"
        case purchaseUris = "purchase_uris"
        case rarity
        case relatedUris = "related_uris"
        case releasedAt = "released_at"
        case reprint
        case scryfallSetUri = "scryfall_set_uri"
        case setName = "set_name"
        case setSearchUri = "set_search_uri"
        case setType = "set_type"
        case setUri = "set_uri"
        case set
        case setId = "set_id"
        case storySpotlight = "story_spotlight"
        case textless
        case variation
        case variationOf = "variation_of"
        case securityStamp = "security_stamp"
        case watermark
        
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        arenaId = try container.decodeIfPresent(Int.self, forKey: .arenaId) ?? -1
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        lang = try container.decodeIfPresent(String.self, forKey: .lang) ?? ""
        mtgoId = try container.decodeIfPresent(Int.self, forKey: .mtgoId) ?? -1
        mtgoFoilId = try container.decodeIfPresent(Int.self, forKey: .mtgoFoilId) ?? -1
        multiverseId = try container.decodeIfPresent([Int].self, forKey: .multiverseId) ?? []
        tcgplayerId = try container.decodeIfPresent(Int.self, forKey: .tcgplayerId) ?? -1
        tcgplayerEtchedId = try container.decodeIfPresent(Int.self, forKey: .tcgplayerEtchedId) ?? -1
        cardmarketId = try container.decodeIfPresent(Int.self, forKey: .cardmarketId) ?? -1
        object = try container.decodeIfPresent(String.self, forKey: .object) ?? ""
        oracleId = try container.decodeIfPresent(String.self, forKey: .oracleId) ?? ""
        printsSearchUri = try container.decodeIfPresent(String.self, forKey: .printsSearchUri) ?? ""
        rulingsUri = try container.decodeIfPresent(String.self, forKey: .rulingsUri) ?? ""
        scryfallUri = try container.decodeIfPresent(String.self, forKey: .scryfallUri) ?? ""
        uri = try container.decodeIfPresent(String.self, forKey: .uri) ?? ""
        
        allParts = try container.decodeIfPresent([RelatedCard].self, forKey: .allParts) ?? []
        cardFaces = try container.decodeIfPresent([CardFace].self, forKey: .cardFaces) ?? []
        cmc = try container.decodeIfPresent(Double.self, forKey: .cmc) ?? -1
        colorIdentity = try container.decodeIfPresent([String].self, forKey: .colorIdentity) ?? []
        colorIndicator = try container.decodeIfPresent([String].self, forKey: .colorIndicator) ?? []
        colors = try container.decodeIfPresent([String].self, forKey: .colors) ?? []
        edhrecRank = try container.decodeIfPresent(Int.self, forKey: .edhrecRank) ?? -1
        handModifier = try container.decodeIfPresent(String.self, forKey: .handModifier) ?? ""
        keywords = try container.decodeIfPresent([String].self, forKey: .keywords) ?? []
        layout = try container.decodeIfPresent(String.self, forKey: .layout) ?? ""
        legalities = try container.decodeIfPresent(CardLegality.self, forKey: .legalities) ?? CardLegality()
        lifeModifier = try container.decodeIfPresent(String.self, forKey: .lifeModifier) ?? ""
        loyalty = try container.decodeIfPresent(String.self, forKey: .loyalty) ?? ""
        manaCost = try container.decodeIfPresent(String.self, forKey: .manaCost) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        oracleText = try container.decodeIfPresent(String.self, forKey: .oracleText) ?? ""
        oversized = try container.decodeIfPresent(Bool.self, forKey: .oversized) ?? false
        pennyRank = try container.decodeIfPresent(Int.self, forKey: .pennyRank) ?? -1
        power = try container.decodeIfPresent(String.self, forKey: .power) ?? ""
        producedMana = try container.decodeIfPresent([String].self, forKey: .producedMana) ?? []
        reserved = try container.decodeIfPresent(Bool.self, forKey: .reserved) ?? false
        toughness = try container.decodeIfPresent(String.self, forKey: .toughness) ?? ""
        typeLine = try container.decodeIfPresent(String.self, forKey: .typeLine) ?? ""
        
        artist = try container.decodeIfPresent(String.self, forKey: .artist) ?? ""
        booster = try container.decodeIfPresent(Bool.self, forKey: .booster) ?? false
        borderColor = try container.decodeIfPresent(String.self, forKey: .borderColor) ?? ""
        cardBackId = try container.decodeIfPresent(String.self, forKey: .cardBackId) ?? ""
        collectorNumber = try container.decodeIfPresent(String.self, forKey: .collectorNumber) ?? ""
        contentWarning = try container.decodeIfPresent(Bool.self, forKey: .contentWarning) ?? false
        digital = try container.decodeIfPresent(Bool.self, forKey: .digital) ?? false
        finishes = try container.decodeIfPresent([String].self, forKey: .finishes) ?? []
        flavorName = try container.decodeIfPresent(String.self, forKey: .flavorName) ?? ""
        flavorText = try container.decodeIfPresent(String.self, forKey: .flavorText) ?? ""
        frameEffect = try container.decodeIfPresent([String].self, forKey: .frameEffect) ?? []
        frame = try container.decodeIfPresent(String.self, forKey: .frame) ?? ""
        fullArt = try container.decodeIfPresent(Bool.self, forKey: .fullArt) ?? false
        games = try container.decodeIfPresent([String].self, forKey: .games) ?? []
        highresImage = try container.decodeIfPresent(Bool.self, forKey: .highresImage) ?? false
        illustrationId = try container.decodeIfPresent(String.self, forKey: .illustrationId) ?? ""
        imageStatus = try container.decodeIfPresent(String.self, forKey: .imageStatus) ?? ""
        imageUris = try container.decodeIfPresent(CardImagery.self, forKey: .imageUris) ?? CardImagery()
        prices = try container.decodeIfPresent(CardPrice.self, forKey: .prices) ?? CardPrice()
        printedName = try container.decodeIfPresent(String.self, forKey: .printedName) ?? ""
        printedText = try container.decodeIfPresent(String.self, forKey: .printedText) ?? ""
        printedTypeLine = try container.decodeIfPresent(String.self, forKey: .printedTypeLine) ?? ""
        promo = try container.decodeIfPresent(Bool.self, forKey: .promo) ?? false
        promoTypes = try container.decodeIfPresent([String].self, forKey: .promoTypes) ?? []
        purchaseUris = try container.decodeIfPresent(CardPurchaseUri.self, forKey: .purchaseUris) ?? CardPurchaseUri()
        rarity = try container.decodeIfPresent(String.self, forKey: .rarity) ?? ""
        relatedUris = try container.decodeIfPresent(CardRelatedUri.self, forKey: .relatedUris) ?? CardRelatedUri()
        releasedAt = try container.decodeIfPresent(String.self, forKey: .releasedAt) ?? ""
        reprint = try container.decodeIfPresent(Bool.self, forKey: .reprint) ?? false
        scryfallSetUri = try container.decodeIfPresent(String.self, forKey: .scryfallSetUri) ?? ""
        setName = try container.decodeIfPresent(String.self, forKey: .setName) ?? ""
        setSearchUri = try container.decodeIfPresent(String.self, forKey: .setSearchUri) ?? ""
        setType = try container.decodeIfPresent(String.self, forKey: .setType) ?? ""
        setUri = try container.decodeIfPresent(String.self, forKey: .setUri) ?? ""
        set = try container.decodeIfPresent(String.self, forKey: .set) ?? ""
        setId = try container.decodeIfPresent(String.self, forKey: .setId) ?? ""
        storySpotlight = try container.decodeIfPresent(Bool.self, forKey: .storySpotlight) ?? false
        textless = try container.decodeIfPresent(Bool.self, forKey: .textless) ?? false
        variation = try container.decodeIfPresent(Bool.self, forKey: .variation) ?? false
        variationOf = try container.decodeIfPresent(String.self, forKey: .variationOf) ?? ""
        securityStamp = try container.decodeIfPresent(String.self, forKey: .securityStamp) ?? ""
        watermark = try container.decodeIfPresent(String.self, forKey: .watermark) ?? ""
    }
}

extension Card: Hashable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Card {
    var manaSymbols: NSMutableAttributedString {
        var mana = ""
        if self.cardFaces.count > 1 {
            let card1 = self.cardFaces[0].manaCost
            let card2 = self.cardFaces[1].manaCost
            mana = card1 + " // " + card2
            
        } else {
            mana = self.manaCost
        }
        
        let regex = "\\{[^}]*\\}"
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


func matches(for regex: String, in text: String) -> [String] {
    do {
        let regex = try NSRegularExpression(pattern: regex)
        let results = regex.matches(in: text,
                                    range: NSRange(text.startIndex..., in: text))
        return results.map {
            String(text[Range($0.range, in: text)!])
        }
    } catch let error {
        print("invalid regex: \(error.localizedDescription)")
        return []
    }
}

class ListCard: Decodable {
    var data: [Card] = []
    
    required init() {}
}
