////
////  ImageCardCell.swift
////  MagicGatheringUIKit
////
////  Created by Nguyễn Việt on 09/08/2022.
////
//
//import UIKit
//import SnapKit
//import Kingfisher
//
//class ImageCardCell: UITableViewCell {
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    var clicked: (() -> ())?
//    
//    var cardVM: CardDetailViewModel! {
//        didSet {
//            setupUI()
//        }
//    }
//    
//    let containerView = UIView()
//    
//    let image: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//    
//    private lazy var flipButton: UIButton = {
//        let btn = UIButton()
//        btn.setImage(UIImage(systemName: "arrow.left.arrow.right"), for: .normal)
//        btn.addTarget(self, action: #selector(ImageCardCell.tapOnFlip), for: .touchUpInside)
//        btn.isUserInteractionEnabled = true
//        return btn
//    }()
//    
//    @objc func tapOnFlip() {
//        clicked?()
//    }
//    
//    func flipImage() {
//        let face1 = cardVM!.cardFaces[0].imageUris.normal
//        let face2 = cardVM!.cardFaces[1].imageUris.normal
//        guard let cardVM = cardVM else {
//            return
//        }
//
//        let url = cardVM.isFlipped ? URL(string: face1) : URL(string: face2)
//        if let url = url {
//            UIView.transition(with: image, duration: 0.7,options: .transitionFlipFromLeft) {
//                self.image.kf.setImage(with: url)
//            }
//        }
//    }
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        
//    }
//    
//    func setupUI() {
//        contentView.addSubview(containerView)
//        containerView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//        
//        containerView.addSubview(image)
//        image.snp.makeConstraints { make in
//            make.top.left.right.equalToSuperview().offset(10)
//            make.bottom.equalToSuperview().offset(-10)
//        }
//        
//        containerView.addSubview(flipButton)
//        flipButton.snp.makeConstraints { make in
//            make.top.equalTo(image).offset(20)
//            make.trailing.equalTo(image).offset(-20)
//            make.height.width.equalTo(80)
//        }
//        containerView.bringSubviewToFront(flipButton)
//        
//        guard let cardVM = cardVM else {
//            return
//        }
//        
//        if cardVM.isMultiFaces {
//            flipButton.isHidden = false
//            let url = cardVM.isFlipped ? URL(string: cardVM.cardFaces[0].imageUris.normal) : URL(string: cardVM.cardFaces[1].imageUris.normal)
//            if let url = url {
//                image.kf.setImage(with: url)
//            }
//        } else {
//            flipButton.isHidden = true
//            if let url = URL(string: cardVM.url) {
//                image.kf.setImage(with: url)
//            }
//        }
//    }
//}
