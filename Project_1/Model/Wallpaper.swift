//
//  Wallpaper.swift
//  Project_1
//
//  Created by Trung Kiên on 11/19/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

import UIKit
import SwiftRandom

class Wallpaper: NSObject {
    var imageUrl : String? = nil
    var date : Date? = nil
    override init() {
        
    }
    init(_ imageUrl : String) {
        self.imageUrl = imageUrl
        self.date = Randoms.randomFakeDate()
    }
}
