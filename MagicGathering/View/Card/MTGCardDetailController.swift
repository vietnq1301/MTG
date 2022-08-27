//
//  MTGCardDetailController.swift
//  MagicGathering
//
//  Created by Nguyễn Việt on 25/08/2022.
//

import UIKit
import SwiftUI

class MTGCardDetailController: BaseViewController {
    
    private let ACTION_BUTTON_HEIGHT: CGFloat = 40
    private let ACTION_BUTTON_WIDTH: CGFloat = 130
    // Image Card if rotate or flip
    private var isTapepd = false
    
    var viewModel: MTGCardDetailViewModel!
    
    
    let scrollView = UIScrollView()
    let containerView = UIView()
    let imgCard: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        
        return img
    }()
    
    let infoStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    
    let lbArtist = UILabel()
    
    var stackBtn: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.axis = .horizontal
        return stack
    }()
    
    var rotateBtn: UIButton = {
        let btn = UIButton()
        btn.config(type: .rotate)
        return btn
    }()
    
    var flipBtn: UIButton = {
        let btn = UIButton()
        btn.config(type: .flip)
        return btn
    }()
    
    var transformBtn: UIButton = {
        let btn = UIButton()
        btn.config(type: .transform)
        return btn
    }()
    
    var turnOverBtn: UIButton = {
        let btn = UIButton()
        btn.config(type: .turnOver)
        return btn
    }()
    
    var viewBackBtn: UIButton = {
        let btn = UIButton()
        btn.config(type: .viewBack)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonActions()
    }
    
    override func setupUI() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.left.right.equalTo(view)
            
        }
        scrollView.contentInsetAdjustmentBehavior = .never
        
        scrollView.addSubview(containerView)
        scrollView.backgroundColor = .white
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalTo(self.scrollView)
            make.left.right.equalTo(self.view)
            make.width.equalTo(self.scrollView)
        }
        
        containerView.backgroundColor = .white
        containerView.addSubview(imgCard)
        containerView.addSubview(lbArtist)
        
        imgCard.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(MEDIUM_PADDING)
            make.leading.equalTo(containerView).offset(MEDIUM_PADDING)
            make.trailing.equalTo(containerView).offset(-MEDIUM_PADDING)
            make.height.equalTo(400)
        }
        
        containerView.addSubview(stackBtn)
        stackBtn.snp.makeConstraints { make in
            make.top.equalTo(imgCard.snp.bottom).offset(PADDING)
            make.centerX.equalTo(containerView)
        }
        
        if viewModel.layout == "normal" {
            stackBtn.isHidden = true
        } else {
            stackBtn.isHidden = false
        }
        
        rotateBtn.snp.makeConstraints { make in
            make.height.equalTo(ACTION_BUTTON_HEIGHT)
            make.width.equalTo(ACTION_BUTTON_WIDTH)
        }
        
        flipBtn.snp.makeConstraints { make in
            make.height.equalTo(ACTION_BUTTON_HEIGHT)
            make.width.equalTo(ACTION_BUTTON_WIDTH)
        }
        
        transformBtn.snp.makeConstraints { make in
            make.height.equalTo(ACTION_BUTTON_HEIGHT)
            make.width.equalTo(ACTION_BUTTON_WIDTH)
        }
        
        viewBackBtn.snp.makeConstraints { make in
            make.height.equalTo(ACTION_BUTTON_HEIGHT)
            make.width.equalTo(ACTION_BUTTON_WIDTH)
        }
        
        turnOverBtn.snp.makeConstraints { make in
            make.height.equalTo(ACTION_BUTTON_HEIGHT)
            make.width.equalTo(ACTION_BUTTON_WIDTH)
        }
        
        let infoView = UIView()
        containerView.addSubview(infoView)
        infoView.snp.makeConstraints { make in
            if stackBtn.isHidden {
                make.top.equalTo(imgCard.snp.bottom).offset(PADDING)
            } else {
                make.top.equalTo(stackBtn.snp.bottom).offset(LARGE_PADDING)
            }
            make.left.equalTo(containerView.safeAreaLayoutGuide).offset(MEDIUM_PADDING)
            make.right.equalTo(containerView.safeAreaLayoutGuide).offset(-MEDIUM_PADDING)
            make.bottom.equalTo(containerView).offset(-30)
            
        }
        infoView.addBorders(to: [.top, .bottom], in: .black, width: 2)
        infoView.addBorders(to: [.left, .right], in: .separator, width: 1)
        infoView.addSubview(infoStackView)
        
        infoStackView.snp.makeConstraints { make in
            
            make.top.equalTo(infoView).offset(SMALL_PADDING)
            make.left.equalTo(infoView).offset(SMALL_PADDING)
            make.right.equalTo(infoView).offset(-SMALL_PADDING)
        }
        
        infoView.addSubview(lbArtist)
        lbArtist.snp.makeConstraints { make in
            make.top.equalTo(infoStackView.snp.bottom).offset(SMALL_PADDING)
            make.left.equalTo(infoView).offset(18)
            make.right.equalTo(infoView).offset(-18)
            make.bottom.equalTo(infoView.snp.bottom).offset(-SMALL_PADDING)
        }
        
    }
    
    override func setupData() {
        if viewModel.isMultiFaces {
            guard let urlFace1 = URL(string: viewModel.imageURLs[0]) else { return }
            guard let urlFace2 = URL(string: viewModel.imageURLs[1]) else { return }
            
            let url = isTapepd ? urlFace2 : urlFace1
            imgCard.kf.setImage(with: url)
        } else {
            guard let url = URL(string: viewModel.imageURLs[0]) else { return }
            imgCard.kf.setImage(with: url)
        }
        
        let layout = viewModel.layout
        if layout == "split"  {
            stackBtn.addArrangedSubview([rotateBtn])
        } else if layout == "flip" {
            stackBtn.addArrangedSubview([flipBtn])
        } else if layout == "transform" {
            stackBtn.addArrangedSubview([transformBtn])
        } else if layout == "modal_dfc" || layout == "double_faced_token" {
            stackBtn.addArrangedSubview([turnOverBtn])
        } else if layout == "meld" || layout == "scheme" {
            stackBtn.addArrangedSubview([viewBackBtn])
        } else if layout == "planar" {
            stackBtn.addArrangedSubview([rotateBtn, viewBackBtn])
        } else if layout == "art_series" {
            stackBtn.addArrangedSubview([rotateBtn, turnOverBtn])
        }
        
        let cards = viewModel.generateData()
        cards.forEach { card in
            let view = generateView(card: card)
            infoStackView.addArrangedSubview(view)
        }
        
        lbArtist.text = "Illustrated by " + viewModel.artist
        
    }
    
    
    
    func setupButtonActions() {
        rotateBtn.addTarget(self, action: #selector(tapOnRotate), for: .touchUpInside)
        flipBtn.addTarget(self, action: #selector(tapOnFlip), for: .touchUpInside)
        transformBtn.addTarget(self, action: #selector(tapOnTransform), for: .touchUpInside)
        turnOverBtn.addTarget(self, action: #selector(tapOnTurnOver), for: .touchUpInside)
        viewBackBtn.addTarget(self, action: #selector(tapOnViewBack), for: .touchUpInside)
    }
    
    @objc func tapOnRotate() {
        rotateBtn.pulsate()
        isTapepd.toggle()

        if !isTapepd {
            UIView.animate(withDuration: 1) {
                self.imgCard.transform = CGAffineTransform.identity
            }
        } else {
            var t = CGAffineTransform.identity
            t = t.rotated(by: .pi/2)
            t = t.scaledBy(x: 0.8, y: 0.8)
            UIView.animate(withDuration: 1) {
                self.imgCard.transform = t
            }
        }

    }
    
    @objc func tapOnFlip() {
        flipBtn.pulsate()
        isTapepd.toggle()
        if !isTapepd {
            UIView.animate(withDuration: 1) {
                self.imgCard.transform = CGAffineTransform.identity
            }
        } else {
            UIView.animate(withDuration: 1) {
                self.imgCard.transform = CGAffineTransform(rotationAngle: .pi)
            }
//            var t = CGAffineTransform.identity
//            t = t.rotated(by: .pi)
//            t = t.scaledBy(x: 0.8, y: 0.8)
//            UIView.animate(withDuration: 0.7) {
//                self.imgCard.transform = t
//            }
//

            
        }

    }
    
    @objc func tapOnTransform() {
        transformBtn.pulsate()
        guard let face1 = URL(string: viewModel.cardFaces[0].imageUris.normal) else { return }
        guard let face2 = URL(string: viewModel.cardFaces[1].imageUris.normal) else { return }
        isTapepd.toggle()
        let url = isTapepd ? face2 : face1
        UIView.transition(with: imgCard, duration: 0.7,options: .transitionFlipFromLeft) {
            self.imgCard.kf.setImage(with: url)
        }
    }
    
    @objc func tapOnTurnOver() {
        turnOverBtn.pulsate()
        guard let face1 = URL(string: viewModel.cardFaces[0].imageUris.normal) else { return }
        guard let face2 = URL(string: viewModel.cardFaces[1].imageUris.normal) else { return }
        isTapepd.toggle()
        let url = isTapepd ? face2 : face1
        UIView.transition(with: imgCard, duration: 0.7,options: .transitionFlipFromLeft) {
            self.imgCard.kf.setImage(with: url)
        }

    }
    
    @objc func tapOnViewBack() {
        viewBackBtn.pulsate()
        guard let face1 = URL(string: viewModel.cardFaces[0].imageUris.normal) else { return }
        guard let face2 = URL(string: viewModel.cardFaces[1].imageUris.normal) else { return }
        isTapepd.toggle()
        let url = isTapepd ? face2 : face1
        UIView.transition(with: imgCard, duration: 0.7,options: .transitionFlipFromLeft) {
            self.imgCard.kf.setImage(with: url)
        }

    }
    
    func generateView(card: BasicCard) -> UIView {
        let view = UIView()
        let lbTitle = UILabel(title: card.title, numberOfLines: 0, font: .systemFont(ofSize: 20, weight: .semibold))
        let lbMana = UILabel()
        lbMana.attributedText = card.mana.toSymbol()
        
        let lbType = UILabel(title: card.type)
        
        let lbOracleText = UILabel()
        lbOracleText.numberOfLines = 0
        lbOracleText.lineBreakMode = .byWordWrapping
        lbOracleText.font = .systemFont(ofSize: 16, weight: .regular)
        
        let attrOracleText = NSMutableAttributedString(string: card.oracleText)
        attrOracleText.addItalic()
        attrOracleText.toSymbol()
        lbOracleText.attributedText = attrOracleText
        
        let lbFlavor = UILabel()
        lbFlavor.numberOfLines = 0
        lbFlavor.lineBreakMode = .byWordWrapping
//        let attrFlavor = NSMutableAttributedString(string: card.flavorText)
//        attrFlavor.addItalic(of: card.flavorText)
        lbFlavor.text = card.flavorText
        lbFlavor.font = .italicSystemFont(ofSize: 16)
        
        
        let lbPowerAndToughness = UILabel(title: "\(card.power)" + "/" +  "\(card.toughness)")
        
        let divider1 = Divider()
        divider1.isHidden = card.title.isEmpty ? true : false
        
        let divider2 = Divider()
        divider2.isHidden = card.mana.isEmpty ? true : false
        
        let divider3 = Divider()
        divider3.isHidden = card.type.isEmpty ? true : false
        
        let divider4 = Divider()
        divider4.isHidden = card.oracleText.isEmpty ? true : false
        
        let divider5 = Divider()
        divider5.isHidden = (card.power.isEmpty && card.toughness.isEmpty) ? true : false
        lbPowerAndToughness.isHidden = (card.power.isEmpty && card.toughness.isEmpty) ? true : false
        view.addSubviews([lbTitle, divider1, lbMana, divider2, lbType, divider3, lbOracleText, lbFlavor, divider4, lbPowerAndToughness, divider5])
        
        lbTitle.snp.makeConstraints { make in
            make.top.equalTo(view).offset(10)
            make.leading.equalTo(view).offset(10)
            make.trailing.equalTo(view).offset(-10)
        }
        
        divider1.snp.makeConstraints { make in
            make.top.equalTo(lbTitle.snp.bottom).offset(5)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(DIVIDER_HEIGHT)
        }
        
        lbMana.snp.makeConstraints { make in
            make.top.equalTo(divider1.snp.bottom).offset(5)
            make.leading.equalTo(view).offset(10)
            make.trailing.equalTo(view).offset(-10)
        }
        
        divider2.snp.makeConstraints { make in
            make.top.equalTo(lbMana.snp.bottom).offset(5)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(DIVIDER_HEIGHT)
        }
        
        lbType.snp.makeConstraints { make in
            make.top.equalTo(divider2.snp.bottom).offset(5)
            make.leading.equalTo(view).offset(10)
            make.trailing.equalTo(view).offset(-10)
        }
        
        divider3.snp.makeConstraints { make in
            make.top.equalTo(lbType.snp.bottom).offset(5)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(DIVIDER_HEIGHT)
        }
        
        lbOracleText.snp.makeConstraints { make in
            make.top.equalTo(divider3.snp.bottom).offset(5)
            make.leading.equalTo(view).offset(10)
            make.trailing.equalTo(view).offset(-10)
        }
        
        lbFlavor.snp.makeConstraints { make in
            make.top.equalTo(lbOracleText.snp.bottom).offset(5)
            make.leading.equalTo(view).offset(10)
            make.trailing.equalTo(view).offset(-10)
        }
        
        divider4.snp.makeConstraints { make in
            make.top.equalTo(lbFlavor.snp.bottom).offset(5)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(DIVIDER_HEIGHT)
        }
        
        lbPowerAndToughness.snp.makeConstraints { make in
            make.top.equalTo(divider4.snp.bottom).offset(5)
            make.leading.equalTo(view).offset(10)
            make.trailing.equalTo(view).offset(-10)
        }
        
        divider5.snp.makeConstraints { make in
            make.top.equalTo(lbPowerAndToughness.snp.bottom).offset(5)
            make.leading.trailing.equalTo(view)
            make.bottom.equalTo(view).offset(-10)
            make.height.equalTo(DIVIDER_HEIGHT)
        }
        return view
    }
    
    
    
}
