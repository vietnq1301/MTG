//
//  VerticalStackView.swift
//  MagicGatheringUIKit
//
//  Created by Nguyễn Việt on 16/08/2022.
//

import UIKit

class VerticalStackView: UIStackView {
    init(
        arrangedSubviews: [UIView],
        spacing: CGFloat = 0,
        alignment: UIStackView.Alignment = .leading,
        distribution: UIStackView.Distribution = .fillEqually
    ) {
        super.init(frame: .zero)
        self.spacing = spacing
        self.axis = .vertical
        self.alignment = alignment
        self.distribution = distribution
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
