//
//  ImageCollectionViewCell.swift
//  imagePicker
//
//  Created by Imcrinox Mac on 26/12/1444 AH.
//

import Foundation
import UIKit

class ImageCollectionViewCell : UICollectionViewCell {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initialize()
    }
    
    private func  initialize() {
        addSubview(imageView)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image  = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = bounds

    }
}
