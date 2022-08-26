//
//  UIButton+Ext.swift
//  MagicGatheringUIKit
//
//  Created by Nguyễn Việt on 17/08/2022.
//

import UIKit

enum CustomButtonType {
    case normal
    case rotate
    case flip
    case transform
    case turnOver
    case viewBack
}

extension UIButton {
    convenience init(title: String) {
        self.init(type: .custom)
        self.setTitle(title, for: .normal)
    }
}

extension UIButton {
    func config(type: CustomButtonType) {
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = .systemBlue
        self.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        self.layer.masksToBounds = false
        
        self.setInsets(forContentPadding: .zero, imageTitlePadding: 10)
        self.round(corners: .all)
        switch type {
        case .normal:
            self.isHidden = true
        case .rotate:
            self.setTitle("Rotate", for: .normal)
            let rotateIcon = UIImage(named: "rotate")
            let tintedRotateIcon = rotateIcon?.withRenderingMode(.alwaysTemplate)
            self.setImage(tintedRotateIcon, for: .normal)
            self.tintColor = .white
        case .flip:
            self.setTitle("Flip", for: .normal)
//            let icon = UIImage(systemName: "arrow.clockwise")
//            self.setImage(icon, for: .normal)
//            self.tintColor = .white
            
            let rotateIcon = UIImage(named: "rotate")
            let tintedRotateIcon = rotateIcon?.withRenderingMode(.alwaysTemplate)
            self.setImage(tintedRotateIcon, for: .normal)
            self.tintColor = .white
        case .transform:
            self.setTitle("Transform", for: .normal)
            self.setImage(UIImage(systemName: "arrow.triangle.2.circlepath"), for: .normal)
            self.tintColor = .white

        case .turnOver:
            self.setTitle("Turn Over", for: .normal)
            self.setImage(UIImage(systemName: "arrow.triangle.2.circlepath"), for: .normal)
            self.tintColor = .white

        case .viewBack:
            self.setTitle("View Back", for: .normal)
            self.setImage(UIImage(systemName: "arrow.triangle.2.circlepath"), for: .normal)
            self.tintColor = .white

        }
    }
    
    func setInsets(
        forContentPadding contentPadding: UIEdgeInsets,
        imageTitlePadding: CGFloat
    ) {
        self.contentEdgeInsets = UIEdgeInsets(
            top: contentPadding.top,
            left: contentPadding.left,
            bottom: contentPadding.bottom,
            right: contentPadding.right + imageTitlePadding
        )
        self.titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: imageTitlePadding,
            bottom: 0,
            right: -imageTitlePadding
        )
    }
    
    func pulsate() {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }, completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.transform = CGAffineTransform.identity
            }
        })
    }
}

extension UIImage {
    func rotate(radians: Float) -> UIImage? {
        var newSize = CGRect(origin: CGPoint.zero, size: self.size).applying(CGAffineTransform(rotationAngle: CGFloat(radians))).size
        // Trim off the extremely small float value to prevent core graphics from rounding it up
        newSize.width = floor(newSize.width)
        newSize.height = floor(newSize.height)

        UIGraphicsBeginImageContextWithOptions(newSize, false, self.scale)
        let context = UIGraphicsGetCurrentContext()!

        // Move origin to middle
        context.translateBy(x: newSize.width/2, y: newSize.height/2)
        // Rotate around middle
        context.rotate(by: CGFloat(radians))
        // Draw the image at its center
        self.draw(in: CGRect(x: -self.size.width/2, y: -self.size.height/2, width: self.size.width, height: self.size.height))

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }
}
