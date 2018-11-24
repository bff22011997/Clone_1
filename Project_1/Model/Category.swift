//
//  Category.swift
//  Project_1
//
//  Created by Trung Kiên on 11/19/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

import UIKit

class Category: NSObject {
    var name : String? = nil
    var imageUrl : String? = nil
    var icon : String? = nil
    override init() {
        
    }
    init(_ name : String ,_ imageUrl : String ,_ icon : String) {
        self.name = name
        self.imageUrl = imageUrl
        self.icon = icon
    }
}
