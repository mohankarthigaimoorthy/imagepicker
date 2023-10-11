//
//  imagePickerController.swift
//  imagePicker
//
//  Created by Imcrinox Mac on 26/12/1444 AH.
//

import Foundation
import Photos
import UIKit

private let enlargementAnimationDDuration = 0.3
private let tableViewRowHeight: CGFloat = 50.0
private let tableViewPreviewRowHeight: CGFloat = 140.0
private let tableViewEnlargedPreviewRowHeight: CGFloat = 243.0
private let collectionViewInset: CGFloat = 5.0
private let collectionViewCheckmarkInset : CGFloat = 3.5

public class ImagePickerController: UIViewController, UITableViewDataSource, UITableViewDelegate,
UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIViewControllerTransitioningDelegate {
    
    lazy var tableview: UITableView = {
        let tableView = UITableView()
          tableView.dataSource = self
        tableView.delegate = self
        tableView.alwaysBounceVertical = false
        tableView.layoutMargins = .zero
        tableView.separatorInset = .zero
        tableView.register(imagePreviewtableViewCell.self, forCellReuseIdentifier: NSStringFromClass(imagePreviewtableViewCell.self))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
  return tableView
    }()
    
    private lazy var collectionView: ImagePickerCollectionView = {
        let collectionView = ImagePickerCollectionView()
        collectionView.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        collectionView.imagePreviewLayout.showSupplementaryViews = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.alwaysBounceHorizontal = true
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(ImageCollectionViewCell.self))
        collectionView.register(PreviewSupplementaryView, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NSStringFromClass(PreviewSupplementaryView.self))
        return collectionView
    }()
}
