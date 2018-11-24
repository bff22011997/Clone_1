//
//  MetaData.swift
//  Project_1
//
//  Created by Trung Kiên on 11/19/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

import UIKit
import TaskQueue
let queue = TaskQueue()
class MetaData: NSObject {
    static let share: MetaData = {
        let instance = MetaData()
        let animanwalls = FileName.animanwalls.read(FileType.txt)
        let cities = FileName.cities.read(FileType.txt)
        let fishs = FileName.fishs.read(FileType.txt)
        let flowerwall = FileName.flowerwall.read(FileType.txt)
        let macro = FileName.macro.read(FileType.txt)
        let sexywall = FileName.sexywall.read(FileType.txt)
        
        instance.categories.append(Category("Animals", "animal.jpg", "ic_animal"))
        
        instance.categories.append(Category("Cities", "city.jpg","ic_city"))
        instance.categories.append(Category("Fishs", "fish.jpg" , "ic_fish"))
        
        instance.categories.append(Category("Flowers","flower.jpg", "ic_flower"))
        
        instance.categories.append(Category("Macro","marco.jpg", "ic_marco"))
        
        instance.categories.append(Category("Sexy","sexy.jpg", "ic_sexy"))
        return instance
    }()
     var categories = [Category]()
}
enum MetaHold: String {
    case id = "fc9ee31a27d4ecdf7e644ed473d54a5b85aa4635"
    case isPurchase = "isPurchase"
    case purchaseID = "purchaseID"
    
    static func clear() {
        MetaHold.isPurchase.save(false)
        UserDefaults.standard.synchronize()
    }
    
    var value: Bool {
        return UserDefaults.standard.value(forKey: MetaHold.id.rawValue + rawValue) as? Bool ?? false
    }
    
    func save(_ value: Bool) {
        UserDefaults.standard.set(value, forKey: MetaHold.id.rawValue + rawValue)
        UserDefaults.standard.synchronize()
    }
    
    var stringValue: String {
        return UserDefaults.standard.value(forKey: MetaHold.id.rawValue + rawValue) as? String ?? ""
    }
    
    func save(_ stringValue: String) {
        UserDefaults.standard.set(stringValue, forKey: MetaHold.id.rawValue + rawValue)
        UserDefaults.standard.synchronize()
    }
}

