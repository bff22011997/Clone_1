//
//  CollectionViewCell.swift
//  Project_1
//
//  Created by Trung Kiên on 11/19/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageCategory: UIImageView!
    
    @IBOutlet weak var iconCategory: UIImageView!
    @IBOutlet weak var lblNameCategory: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
