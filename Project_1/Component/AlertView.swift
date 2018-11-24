//
//  AlertView.swift
//  Project_1
//
//  Created by Trung Kiên on 11/23/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

import UIKit

class AlertView: UIView {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var buttonSubmit: UIButton!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSub: UILabel!
    
    init(frame: CGRect, title: String, message: String) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed(AlertView.name, owner: self, options: nil)
        add(view)
        
        buttonSubmit.handle { [weak self] in
            self?.dismiss()
        }
        
        labelTitle.text = title
        labelSub.text = message
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
