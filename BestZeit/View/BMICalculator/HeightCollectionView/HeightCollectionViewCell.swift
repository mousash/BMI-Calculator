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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(index: Int) {
        numberLabel.text = String(index)
    }
    
}
