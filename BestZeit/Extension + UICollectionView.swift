//
//  Extension + Cell.swift
//  BestZeit
//
//  Created by Mousa on 25.07.21.
//

import UIKit

extension UICollectionViewCell {
//    func transformToLarge() {
//        UIView.animate(withDuration: 0.2) {
//            self.transform = CGAffineTransform(scaleX: 1.50, y: 1.50)
//        }
//        let generator = UIImpactFeedbackGenerator(style: .light)
//        generator.impactOccurred()
//    }
//    
//    func transformToStandard() {
//        UIView.animate(withDuration: 0.2) {
//            self.transform = CGAffineTransform.identity
//        }
//    }
}

extension UICollectionView {
    
    var centerPoint : CGPoint {
        get {
            return CGPoint(x: self.center.x + self.contentOffset.x, y: self.center.y + self.contentOffset.y);
        }
    }
    
    var centerCellIndexPath: IndexPath? {
        if let centerIndexPath: IndexPath  = self.indexPathForItem(at: self.centerPoint) {
            return centerIndexPath
        }
        return nil
    }
}
