//
//  CardCell.swift
//  MagicGatheringUIKit
//
//  Created by Nguyễn Việt on 16/07/2022.
//

import UIKit
import SwiftUI
import SnapKit

class CheckListCardCell: UITableViewCell {

    var cardVM: CheckListCardViewModel? {
        didSet {
            guard let cardVM = cardVM else {
                return
            }
            
           configure(viewModel: cardVM)
        }
    }
    
    let containerView = UIView()
    private let lbSet = UILabel(title: "Set")
    private let lbNumber = UILabel(title: "Number",alignment: .center)
    private let lbName = UILabel(title: "Name")
    private let lbMana = UILabel(title: "Mana")
    private let stackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(viewModel: CheckListCardViewModel) {
        lbSet.text = viewModel.set
        lbName.text = viewModel.name
        lbNumber.text = viewModel.number
        lbMana.attributedText = viewModel.mana
    }
    
    private func setupUI() {
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        containerView.addSubviews([lbSet, lbNumber, stackView])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalCentering
        stackView.addArrangedSubview(lbName)
        stackView.addArrangedSubview(lbMana)
        
        lbSet.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(containerView).offset(10)
            make.width.equalTo(50)
        }
        
        lbNumber.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalTo(40)
            make.leading.equalTo(lbSet.snp.trailing).offset(10)
        }
        
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(lbNumber.snp.trailing).offset(10)
            make.trailing.equalTo(containerView).offset(-20)
        }
        containerView.addBorder(to: .top, in: .lightGray, width: 1)
    }
}


