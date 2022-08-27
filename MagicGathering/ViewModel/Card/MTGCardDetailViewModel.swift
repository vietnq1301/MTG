//
//  MTGCardDetailViewModel.swift
//  MagicGathering
//
//  Created by Nguyễn Việt on 25/08/2022.
//

import Foundation

class MTGCardDetailViewModel {
    let card: Card
    
    init(card: Card) {
        self.card = card
    }
    
    var layout: String {
        return card.layout
    }
    
    var isFlip: Bool {
        return card.isFlipped
    }
    
    var cardFaces: [CardFace] {
        return card.cardFaces
    }
    
    var isMultiFaces: Bool {
        return card.cardFaces.count >= 2 && card.cardFaces[0].imageUris.normal != "" && card.cardFaces[1].imageUris.normal != ""
    }
    
    var imageURLs: [String] {
        if isMultiFaces {
            var urls = [String]()
            let faces = card.cardFaces
            faces.forEach { face in
                urls.append(face.imageUris.normal)
            }
            return urls
        } else {
            return [card.imageUris.normal]
        }
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
    
    var artist: String {
        return card.artist
    }
    
}
