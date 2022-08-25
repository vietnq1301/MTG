//
//  ImageCardViewModell.swift
//  MagicGathering
//
//  Created by Nguyễn Việt on 25/08/2022.
//

import UIKit

class ImageCardViewModel {
    let card: Card
    
    init(card: Card) {
        self.card = card
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
}
