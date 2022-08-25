//
//  TextOnlyCardViewModel.swift
//  MagicGatheringUIKit
//
//  Created by Nguyễn Việt on 14/08/2022.
//

import Foundation

struct BasicCard {
    var title = ""
    var mana: NSMutableAttributedString
    var type = ""
    var oracleText = ""
    
    init(title: String,mana: NSMutableAttributedString, type: String, oracleText: String) {
        self.title = title
        self.mana = mana
        self.type = type
        self.oracleText = oracleText
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
                    let basicCard = BasicCard(title: card.name,mana: card.addSymbol(), type: card.typeLine, oracleText: card.oracleText)
                    arr.append(basicCard)
                } else {
                    let basicCard = BasicCard(title: card.name,mana: card.addSymbol(), type: card.typeLine, oracleText: card.oracleText + "\n")
                    arr.append(basicCard)
                }
               
            }
        } else {
            if card.oracleText.isEmpty {
                let basicCard = BasicCard(title: card.name,mana: card.manaSymbols, type: card.typeLine, oracleText: card.oracleText)
                arr.append(basicCard)
            } else {
                let basicCard = BasicCard(title: card.name,mana: card.manaSymbols, type: card.typeLine, oracleText: card.oracleText + "\n")
                arr.append(basicCard)
            }
        }
        return arr
    }
    
    
}
