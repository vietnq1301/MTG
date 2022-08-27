//
//  TextOnlyCardViewModel.swift
//  MagicGatheringUIKit
//
//  Created by Nguyễn Việt on 14/08/2022.
//

import Foundation

struct BasicCard {
    var title = ""
    var mana: String
    var type = ""
    var oracleText = ""
    var power =  ""
    var toughness = ""
    var flavorText = ""
    
    init(title: String,mana: String, type: String, oracleText: String, power: String, toughness: String, flavorText: String) {
        self.title = title
        self.mana = mana
        self.type = type
        self.oracleText = oracleText
        self.power = power
        self.toughness = toughness
        self.flavorText = flavorText
    }
}

class TextOnlyCardViewModel {
    let card: Card
    
    init(card: Card) {
        self.card = card
    }
    
    func generateData() -> [BasicCard] {
        var arr: [BasicCard] = []
        if card.cardFaces.count > 1 {
            let cards = card.cardFaces
            cards.forEach { card in
                if card.oracleText.isEmpty {
                    let basicCard = BasicCard(title: card.name,mana: card.manaCost, type: card.typeLine, oracleText: card.oracleText, power: card.power, toughness: card.toughness, flavorText: card.flavorText)
                    arr.append(basicCard)
                } else {
                    let basicCard = BasicCard(title: card.name,mana: card.manaCost, type: card.typeLine, oracleText: card.oracleText + "\n", power:card.power, toughness: card.toughness, flavorText: card.flavorText)
                    arr.append(basicCard)
                }
               
            }
        } else {
            if card.oracleText.isEmpty {
                let basicCard = BasicCard(title: card.name,mana: card.manaCost, type: card.typeLine, oracleText: card.oracleText, power: card.power, toughness: card.toughness, flavorText: card.flavorText)
                arr.append(basicCard)
            } else {
                let basicCard = BasicCard(title: card.name,mana: card.manaCost, type: card.typeLine, oracleText: card.oracleText + "\n", power:card.power, toughness: card.toughness, flavorText: card.flavorText)
                arr.append(basicCard)
            }
        }
        return arr
    }
    
    
}
