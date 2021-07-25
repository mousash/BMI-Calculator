//
//  HeightCollectionViewCell.swift
//  BestZeit
//
//  Created by Mousa on 24.07.21.
//

import UIKit

class HeightCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier: String = "\(HeightCollectionViewCell.self)"
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var firstLine: UIView!
    @IBOutlet weak var secondLine: UIView!
    @IBOutlet weak var thirdLine: UIView!
    @IBOutlet weak var forthLine: UIView!
    @IBOutlet weak var fifthLine: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        normalCell()
    }

    func configure(index: Int) {
        numberLabel.text = String(index)
    }
    
    func transformToLarge() {
        UIView.animate(withDuration: 0.2) {
//            self.transform = CGAffineTransform(scaleX: 1.50, y: 1.50)
            self.boldCell()
        }
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
    
    func transformToStandard() {
        UIView.animate(withDuration: 0.2) {
//            self.transform = CGAffineTransform.identity
            self.normalCell()
        }
    }
    
    private func normalCell() {
        self.numberLabel?.font = UIFont.systemFont(ofSize: 15)
        self.numberLabel?.alpha = 0.5
        self.firstLine?.alpha = 0.5
        self.secondLine?.alpha = 0.5
        self.thirdLine?.alpha = 0.5
        self.forthLine?.alpha = 0.5
        self.fifthLine?.alpha = 0.5
    }
    
    private func boldCell() {
        self.numberLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        self.numberLabel?.alpha = 1
        self.firstLine?.alpha = 1
        self.secondLine?.alpha = 1
        self.thirdLine?.alpha = 1
        self.forthLine?.alpha = 1
        self.fifthLine?.alpha = 1

    }
}
