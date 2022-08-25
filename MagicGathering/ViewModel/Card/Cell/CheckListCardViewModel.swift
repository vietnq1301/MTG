//
//  CheckListCardViewModel.swift
//  MagicGatheringUIKit
//
//  Created by Nguyễn Việt on 14/08/2022.
//

import UIKit

class CheckListCardViewModel {
    var card: Card
    
    init(card: Card) {
        self.card = card
    }
    
    var set: String {
        return card.set.uppercased()
    }
    
    var number: String {
        return card.collectorNumber
    }
    
    var name: String {
        return card.name
    }
    
    var mana: NSMutableAttributedString {
        return card.manaSymbols
    }
    
}
