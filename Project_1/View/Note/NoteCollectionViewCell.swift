//
//  NoteCollectionViewCell.swift
//  Project_1
//
//  Created by Trung Kiên on 11/28/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

import UIKit

class NoteCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var viewBackground: UIView!
    
    @IBOutlet weak var imageNote: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        viewBackground.layer.cornerRadius = 30
        viewBackground.backgroundColor = UIColor(rgb: 0xe5e7eb)
        viewBackground.clipsToBounds = true
        
  
        
    }

}
