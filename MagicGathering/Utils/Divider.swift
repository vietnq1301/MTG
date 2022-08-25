//
//  Divider.swift
//  MagicGatheringUIKit
//
//  Created by Nguyễn Việt on 16/08/2022.
//

import UIKit

class Divider: UIView {
    init(backgroundColor: UIColor = .separator) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
