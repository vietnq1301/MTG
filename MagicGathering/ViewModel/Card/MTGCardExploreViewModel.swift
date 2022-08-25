//
//  MTGCardExploreViewModel.swift
//  MagicGathering
//
//  Created by Nguyễn Việt on 25/08/2022.
//

import Foundation

class MTGCardExploreViewModel {
    let netword = Network.shared
    var cards = [Card]()
    
    func fetch(query: String, completion: @escaping (()->Void)) {
        netword.getSearchCards(query: query) { result in
            switch result {
            case .success(let list):
                DispatchQueue.main.async {
                    self.cards = list.data
                    completion()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
