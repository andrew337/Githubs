//
//  Helper.swift
//  Git Followers
//
//  Created by Admin on 3/7/22.
//

import UIKit

struct UIHelper {
    static func createThreeColumnFlowLayout(in view : UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding : CGFloat = 12
        let minSpace : CGFloat = 10
        let availableSpace = width - (padding * 2) - (minSpace * 2)
        let itemWidth = availableSpace / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
}
