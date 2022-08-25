//
//  CardLegality.swift
//  MagicGathering
//
//  Created by Nguyễn Việt on 14/07/2022.
//

import Foundation

class CardLegality: Decodable {
    internal init(standard: String = "", future: String = "", historic: String = "", gladiator: String = "", pioneer: String = "", explorer: String = "", modern: String = "", legacy: String = "", pauper: String = "", vintage: String = "", penny: String = "", commander: String = "", brawl: String = "", historicbrawl: String = "", alchemy: String = "", paupercommander: String = "", duel: String = "", oldschool: String = "", premodern: String = "") {
        self.standard = standard
        self.future = future
        self.historic = historic
        self.gladiator = gladiator
        self.pioneer = pioneer
        self.explorer = explorer
        self.modern = modern
        self.legacy = legacy
        self.pauper = pauper
        self.vintage = vintage
        self.penny = penny
        self.commander = commander
        self.brawl = brawl
        self.historicbrawl = historicbrawl
        self.alchemy = alchemy
        self.paupercommander = paupercommander
        self.duel = duel
        self.oldschool = oldschool
        self.premodern = premodern
    }
    var standard: String = ""
    var future: String = ""
    var historic: String = ""
    var gladiator: String = ""
    var pioneer: String = ""
    var explorer: String = ""
    var modern: String = ""
    var legacy: String = ""
    var pauper: String = ""
    var vintage: String = ""
    var penny: String = ""
    var commander: String = ""
    var brawl: String = ""
    var historicbrawl: String = ""
    var alchemy: String = ""
    var paupercommander: String = ""
    var duel: String = ""
    var oldschool: String = ""
    var premodern: String = ""
    
    enum CodingKeys: String, CodingKey {
        case standard
        case future
        case historic
        case gladiator
        case pioneer
        case explorer
        case modern
        case legacy
        case pauper
        case vintage
        case penny
        case commander
        case brawl
        case historicbrawl
        case alchemy
        case paupercommander
        case duel
        case oldschool
        case premodern
    }
    
    required init() {}
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        standard = try container.decodeIfPresent(String.self, forKey: .standard) ?? ""
        future = try container.decodeIfPresent(String.self, forKey: .future) ?? ""
        historic = try container.decodeIfPresent(String.self, forKey: .historic) ?? ""
        gladiator = try container.decodeIfPresent(String.self, forKey: .gladiator) ?? ""
        pioneer = try container.decodeIfPresent(String.self, forKey: .pioneer) ?? ""
        explorer = try container.decodeIfPresent(String.self, forKey: .explorer) ?? ""
        modern = try container.decodeIfPresent(String.self, forKey: .modern) ?? ""
        legacy = try container.decodeIfPresent(String.self, forKey: .legacy) ?? ""
        pauper = try container.decodeIfPresent(String.self, forKey: .pauper) ?? ""
        vintage = try container.decodeIfPresent(String.self, forKey: .vintage) ?? ""
        penny = try container.decodeIfPresent(String.self, forKey: .penny) ?? ""
        commander = try container.decodeIfPresent(String.self, forKey: .commander) ?? ""
        brawl = try container.decodeIfPresent(String.self, forKey: .brawl) ?? ""
        historicbrawl = try container.decodeIfPresent(String.self, forKey: .historicbrawl) ?? ""
        alchemy = try container.decodeIfPresent(String.self, forKey: .alchemy) ?? ""
        paupercommander = try container.decodeIfPresent(String.self, forKey: .pauper) ?? ""
        duel = try container.decodeIfPresent(String.self, forKey: .duel) ?? ""
        oldschool = try container.decodeIfPresent(String.self, forKey: .oldschool) ?? ""
        premodern = try container.decodeIfPresent(String.self, forKey: .premodern) ?? ""
    }
}
