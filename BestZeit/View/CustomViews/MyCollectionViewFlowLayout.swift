//
//  CollectionViewFlowLayout.swift
//  BestZeit
//
//  Created by Mousa on 25.07.21.
//

import UIKit

final class MyCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        scrollDirection = .horizontal
        minimumLineSpacing = 20

    }
    
}
