//
//  IOSHomeView.swift
//  Project_1
//
//  Created by Trung Kiên on 11/21/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

import UIKit

class IOSHomeView: UIView {
   weak var custom : SaveViewController? = nil
    @IBOutlet weak var viewIPX: UIView!
    @IBOutlet weak var viewIP: UIView!
    @IBOutlet var view: UIView!
    @IBOutlet weak var btnCancel: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        Bundle.main.loadNibNamed(IOSHomeView.name, owner: self, options: nil)
        add(view)
        
        
        switch UIDevice.type() {
        case .in58, .in61, .in65:
            viewIP.isHidden = false
            viewIP.isHidden = true
        default:
            viewIPX.isHidden = true
            viewIP.isHidden = false
        }
        btnCancel.addTarget(self, action: #selector(cancel), for: .touchUpInside)
    }
    @objc func cancel() {
        UIView.animate(withDuration: 0.3) {
            self.custom?.viewHome.removeFromSuperview()
            self.custom?.viewButtonSave.isHidden = false
            self.custom?.viewButtonEdit.isHidden = false
            self.custom?.viewButtonHome.isHidden = false
            self.custom?.btnBack.isHidden = false
            self.custom?.imageBack.isHidden = false
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
