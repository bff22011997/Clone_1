//
//  Filename.swift
//  Project_1
//
//  Created by Trung Kiên on 11/19/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

import UIKit
enum FileName: String {
    case animanwalls = "animanwalls_link"
    case cities = "citys_link"
    case fishs = "fishs_link"
    case flowerwall = "flowerwall_link"
    case macro = "macro_link"
    case sexywall = "sexywall_link"
}

enum FileType: String {
    case txt = "txt"
}


extension FileName {
    func read(_ type: FileType) -> [Wallpaper] {
        var wallpapers = [Wallpaper]()
        if let path = Bundle.main.path(forResource: self.rawValue, ofType: type.rawValue) {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let strings = data.components(separatedBy: .newlines)
                for string in strings {
                    wallpapers.append(Wallpaper(string))
                }
            } catch {
                print(error)
            }
        }
        return wallpapers
    }
}

