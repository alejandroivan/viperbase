//
//  CategoryMediaCell.swift
//  ott
//
//  Created by dpsmac1 on 27-04-18.
//  Copyright © 2018 Digitalproserver. All rights reserved.
//

import UIKit
import AlamofireImage

class CategoryMediaCell: UICollectionViewCell {
    // MARK: - Outlets
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Delegate
    var delegate: HomeCellInteractor?
    
    // MARK: - Item
    var item: Media? {
        didSet {
            guard let item = item else {
                return
            }
            
            imageUrl = item.portraitImage.smallestNonNull
            title = item.name
        }
    }
    
    // MARK: - Image
    static let placeholderImage: UIImage? = UIImage(named: "category_media_cell_placeholder")
    private var imageUrl: String? {
        didSet {
            imageView.af_cancelImageRequest()
            
            guard let urlString = imageUrl, let url = URL(string: urlString) else {
                imageView.image = CategoryMediaCell.placeholderImage
                return
            }
            
            imageView.af_setImage(withURL: url, placeholderImage: CategoryMediaCell.placeholderImage, filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: UIImageView.ImageTransition.crossDissolve(0.3), runImageTransitionIfCached: true, completion: nil)
        }
    }
    
    // MARK: - Title
    static let placeholderTitle: String? = ""
    private var title: String? {
        didSet {
            guard let title = title else {
                titleLabel.text = CategoryMediaCell.placeholderTitle
                return
            }
            
            titleLabel.text = title
        }
    }
}
