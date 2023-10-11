//
//  imagePickerCollectionView.swift
//  imagePicker
//
//  Created by Imcrinox Mac on 26/12/1444 AH.
//

import Foundation
import UIKit

class ImagePickerCollectionView: UICollectionView {
    
    var bouncing: Bool {
        return contentOffset.x < -contentInset.left || contentOffset.x + frame.width > contentSize.width + contentInset.right
    }
    
    var imagePreviewLayout: imagePreviewFlowLayout {
        return collectionViewLayout as! imagePreviewFlowLayout
    }
    
    
    init() {
        super.init(frame: .zero, collectionViewLayout: imagePreviewFlowLayout())
        initialize()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initialize()
    }
    
    private func initialize() {
        panGestureRecognizer.addTarget(self, action: #selector(handlePanGesture(_:)))
    }
    
    @objc private func handlePanGesture(_ gesturRecognizer: UIPanGestureRecognizer) {
        if gesturRecognizer.state == .ended {
            let translation = gesturRecognizer.translation(in: self)
            if translation == CGPoint.zero {
                if !bouncing {
                    let possibleIndexPath = indexPathForItem(at: gesturRecognizer.location(in: self))
                    if let indexPath = possibleIndexPath {
                        selectItem(at: indexPath, animated: false, scrollPosition: .top)
                        delegate?.collectionView?(self, didSelectItemAt: indexPath)
                    }
                }
            }
        }
    }
}
