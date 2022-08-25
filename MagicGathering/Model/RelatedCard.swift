//
//  RelatedCard.swift
//  MagicGathering
//
//  Created by Nguyễn Việt on 14/07/2022.
//

import Foundation

class RelatedCard: Decodable {
    var id: String = ""
    var object: String = ""
    var component: String = ""
    var name: String = ""
    var typeLine: String = ""
    var uri: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id
        case object
        case component
        case name
        case typeLine = "type_line"
        case uri
    }
    
    required init() {}
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        object = try container.decodeIfPresent(String.self, forKey: .object) ?? ""
        component = try container.decodeIfPresent(String.self, forKey: .component) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        typeLine = try container.decodeIfPresent(String.self, forKey: .typeLine) ?? ""
        uri = try container.decodeIfPresent(String.self, forKey: .uri) ?? ""
    }
}
