//
//  NumberCollectionViewCell.swift
//  BestZeit
//
//  Created by Mousa on 24.07.21.
//

import UIKit

class NumberCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier: String = "\(NumberCollectionViewCell.self)"
    
    @IBOutlet weak var numberLabel: UILabel!
    
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
            self.transform = CGAffineTransform(scaleX: 1.50, y: 1.50)
            self.boldCell()
        }
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
    
    func transformToStandard() {
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform.identity
            self.normalCell()
        }
    }
    
    private func normalCell() {
        self.numberLabel?.alpha = 0.5
    }
    
    private func boldCell() {
        self.numberLabel?.alpha = 1
    }
}
