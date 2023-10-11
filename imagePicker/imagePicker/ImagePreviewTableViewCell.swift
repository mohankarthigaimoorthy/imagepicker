//
//  ImagePreviewTableViewCell.swift
//  imagePicker
//
//  Created by Imcrinox Mac on 26/12/1444 AH.
//

import Foundation
import UIKit

class imagePreviewtableViewCell : UITableViewCell {
    
    var colectionView: ImagePickerCollectionView? {
        willSet{
            if let collectionView = colectionView {
                collectionView.removeFromSuperview()
            }
            if let colletionView = newValue {
                addSubview(collectionView)
            }
        }
    }
    
    override func prepareForReuse()
    {
        collectionView = nil
    }
    
    override func layoutSubViews() {
        super.layoutSubViews()
        
        if let collectionView = collectionView {
            collectionView.frame = CGRect(x: -bounds.width, y: bounds.minY, width: bounds.width
                                          * 3, height: bounds.height)
            collectionView.contentInset = UIEdgeInsets(top: 0.0, left: bounds.width, bottom: 0.0, right: bounds.width)
        }
    }
}
