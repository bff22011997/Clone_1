//
//  IOSHomeView.swift
//  Project_1
//
//  Created by Trung Kiên on 11/21/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

import UIKit

class IOSHomeView: UIView {
    var custom : SaveViewController? = nil
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
        custom?.viewHome.removeFromSuperview()
        custom?.viewButtonSave.isHidden = false
        custom?.viewButtonEdit.isHidden = false
        custom?.viewButtonHome.isHidden = false
        custom?.btnBack.isHidden = false
        custom?.imageBack.isHidden = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
