//
//  CustomButton.swift
//  My Bank
//
//  Created by Mousa on 01.06.21.
//

import UIKit

@IBDesignable
final class CustomButton: UIButton {

    @IBInspectable var titleText: String? {
        didSet {
            setTitle(titleText, for: .normal)
            setTitleColor(UIColor.white,for: .normal)
            titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        }
    }

    override init(frame: CGRect){
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

    func setup() {
        clipsToBounds = true
        layer.cornerRadius = 10
        layer.backgroundColor = UIColor.black.cgColor
    }
}
