//
//  TextOnlyCardCell.swift
//  MagicGatheringUIKit
//
//  Created by Nguyễn Việt on 13/08/2022.
//

import UIKit

class TextOnlyCardCell: UITableViewCell {
    
    var cardVM: TextOnlyCardViewModel? {
        didSet {
            setupUI()
            setupData()
        }
    }
    
    let container = UIView()
    let stackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        stackView.addBorders(to: [.top, .bottom], in: .black, width: 2)
        stackView.addBorders(to: [.left, .right], in: .separator, width: 1)
        stackView.axis = .vertical
    }
    
    func setupData() {
        guard let cardVM = cardVM else {
            return
        }
        
        let cards = cardVM.generateData()
        cards.forEach { card in
            let view = generateView(card: card)
            stackView.addArrangedSubview(view)
        }
    }
    
    func generateView(card: BasicCard) -> UIView {
        let view = UIView()
        let title = UILabel(title: card.title, numberOfLines: 0, font: .systemFont(ofSize: 20, weight: .semibold))
        let mana = UILabel()
        mana.attributedText = card.mana

        let type = UILabel(title: card.type)

        let oracleText = UILabel()
        oracleText.numberOfLines = 0
        oracleText.lineBreakMode = .byWordWrapping
        oracleText.font = .systemFont(ofSize: 16, weight: .regular)
        
        let attrOracleText = card.oracleText
        oracleText.attributedText = attrOracleText.toSymbol()
        
        let divider1 = Divider()
        divider1.isHidden = card.title.isEmpty ? true : false
        
        let divider2 = Divider()
        divider2.isHidden = card.mana.string.isEmpty ? true : false

        let divider3 = Divider()
        divider3.isHidden = card.type.isEmpty ? true : false

        let divider4 = Divider()
        divider4.isHidden = card.oracleText.isEmpty ? true : false

        view.addSubviews([title, divider1, mana, divider2, type, divider3, oracleText, divider4])
        
        title.snp.makeConstraints { make in
            make.top.equalTo(view).offset(10)
            make.leading.equalTo(view).offset(10)
            make.trailing.equalTo(view).offset(-10)
        }
        
        divider1.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(5)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(DIVIDER_HEIGHT)
        }
        
        mana.snp.makeConstraints { make in
            make.top.equalTo(divider1.snp.bottom).offset(5)
            make.leading.equalTo(view).offset(10)
            make.trailing.equalTo(view).offset(-10)
        }
        
        divider2.snp.makeConstraints { make in
            make.top.equalTo(mana.snp.bottom).offset(5)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(DIVIDER_HEIGHT)
        }

        type.snp.makeConstraints { make in
            make.top.equalTo(divider2.snp.bottom).offset(5)
            make.leading.equalTo(view).offset(10)
            make.trailing.equalTo(view).offset(-10)
        }
        
        divider3.snp.makeConstraints { make in
            make.top.equalTo(type.snp.bottom).offset(5)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(DIVIDER_HEIGHT)
        }

        oracleText.snp.makeConstraints { make in
            make.top.equalTo(divider3).offset(5)
            make.leading.equalTo(view).offset(10)
            make.trailing.equalTo(view).offset(-10)
        }
        
        divider4.snp.makeConstraints { make in
            make.top.equalTo(oracleText.snp.bottom).offset(0)
            make.leading.trailing.equalTo(view)
            make.bottom.equalTo(view).offset(-10)
            make.height.equalTo(DIVIDER_HEIGHT)
        }
        
        return view
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        stackView.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
    }
}


