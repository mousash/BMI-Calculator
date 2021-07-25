//
//  WeightCollectionView.swift
//  BestZeit
//
//  Created by Mousa on 24.07.21.
//

import UIKit

class WeightCollectionView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var onceOnly = false
    var centerCell: NumberCollectionViewCell? = NumberCollectionViewCell()
    
    lazy var collectionView : UICollectionView = {
        let layout = MyCollectionViewFlowLayout()
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(UINib(nibName: NumberCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: NumberCollectionViewCell.reuseIdentifier)
        cv.collectionViewLayout = layout
        cv.backgroundColor = .white
        cv.showsHorizontalScrollIndicator = false
        
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
        //Add constraint
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfSections section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 200
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NumberCollectionViewCell.reuseIdentifier, for: indexPath) as? NumberCollectionViewCell else { return UICollectionViewCell() }

        cell.configure(index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 40, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if !onceOnly {
          let indexToScrollTo = IndexPath(item: 56, section: 0)
          collectionView.scrollToItem(at: indexToScrollTo, at: .left, animated: false)
          onceOnly = true
        }
      }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView is UICollectionView else { return }
        
        let centerPoint = CGPoint(x: self.collectionView.frame.size.width / 2 + scrollView.contentOffset.x, y: self.collectionView.frame.size.height / 2 + scrollView.contentOffset.y)
        
        if let indexPath = self.collectionView.indexPathForItem(at: centerPoint), self.centerCell == nil {
            self.centerCell = (self.collectionView.cellForItem(at: indexPath) as! NumberCollectionViewCell)
            
            self.centerCell?.transformToLarge()
        }
        if let cell = self.centerCell {
            let offsetX = centerPoint.x - cell.center.x
            
            if offsetX < -15 || offsetX > 15 {
                cell.transformToStandard()
                self.centerCell = nil
            }
        }
    }
}
