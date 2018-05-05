//
//  HomeCategoryCell.swift
//  ott
//
//  Created by dpsmac1 on 27-04-18.
//  Copyright © 2018 Digitalproserver. All rights reserved.
//

import UIKit

class HomeCategoryCell: UITableViewCell {
    @IBOutlet weak var sectionTitleLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var delegate: HomeCellInteractor?
    
    var section: UInt?
    var category: Category? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}




extension HomeCategoryCell: UICollectionViewDataSource {
    static let cellIdentifier = "CategoryMediaCell"
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category?.items?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCategoryCell.cellIdentifier, for: indexPath) as! CategoryMediaCell
        
        if let item = category?.items?[indexPath.row] {
            cell.item = item
        }
        
        return cell
    }
}




extension HomeCategoryCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let section = section else {
            return
        }
        
        let row = UInt(indexPath.row)
        delegate?.didSelectCell(section: section, row: row)
    }
}
