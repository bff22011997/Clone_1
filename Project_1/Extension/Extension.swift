//
//  Extension.swift
//  Project_1
//
//  Created by Trung Kiên on 11/19/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

import UIKit
import SwiftRandom
import SwiftyStoreKit

extension NSObject {
    static var name: String {
        return String(describing: self)
    }
}

extension String {
    func inHTML() -> String {
        return "<html><head><style>div.ex1 {margin-top: -8px; margin-bottom: -8px; margin-right: -8px; margin-left: -8px; font-size: 10px; color: [backgroundColor]; text-align: justify;} a:link { color: [linkColor]; } body { background-color: hsla(0, 0, 0, 0);}</style><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"></head> <body><div class=\"ex1\">\(self)</div></body></html>"
    }
}

extension Randoms {
    static func randomFakeDate() -> Date {
        return Calendar.current.date(byAdding: .day, value: -Int.random(in: 0 ..< 30), to: Date()) ?? Date()
    }
}

enum DeviceType {
    case in40
    case in47
    case in55
    case in58
    case in61
    case in65
}

extension UIDevice {
    class func type() -> DeviceType {
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                return .in40
            case 1334:
                return .in47
            case 1920, 2208:
                return .in55
            case 2436:
                return .in58
            case 1792:
                return .in61
            case 2688:
                return .in65
            default:
                break
            }
        }
        return .in40
    }
}

extension UIView {
    func add(_ view: UIView) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[view]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["view": view]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["view": view]))
    }
    func dismiss() {
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0
        }) { _ in
            self.removeFromSuperview()
        }
    }
}

enum DateType: String {
    case none = "dd/MM/yyyy"
    case month = "MMM dd, yyyy"
}

extension Date {
    
    func to(_ type: DateType) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = type.rawValue
        return dateFormatter.string(from: self)
    }
    
    func to(_ format: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

var top: UIViewController {
    return UIViewController.topController() ?? UIViewController()
}

extension UIViewController {
    class func topController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            return tab
        }
        if let presented = base?.presentedViewController {
            return topController(base: presented)
        }
        return base
    }
    
    
    func add(_ viewController: UIViewController) {
        if let navigationController = navigationController {
            navigationController.show(viewController, sender: nil)
        } else {
            if let navigationController = top.navigationController {
                navigationController.show(viewController, sender: nil)
            } else {
                let navigationController = UINavigationController(rootViewController: viewController)
                navigationController.isNavigationBarHidden = true
                
                top.present(navigationController, animated: true, completion: nil)
            }
        }
    }
    func add(_ title: String, message: String) {
        let view = AlertView(frame: size, title: title, message: message)
        top.add(view)
    }
    
    
    
    func present(_ viewController: UIViewController) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    func add(_ view: UIView) {
        var isCanAdd = true
        for subview in self.view.subviews {
            if type(of: view) == type(of: subview) {
                isCanAdd = false
            }
        }
        if isCanAdd {
            self.view.add(view)
        }
    }
    var size: CGRect {
        return CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
    
    func dismiss() {
        if let navigationController = self.navigationController {
            _ = navigationController.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
}


extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFill) {  
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
    
}
let imageCache = NSCache<AnyObject, AnyObject>()
private var AssociatedObjectHandle: UInt8 = 0
extension UIImageView {
    
    var imageUrl: URL? {
        get {
            guard let imageUrl = objc_getAssociatedObject(self, &AssociatedObjectHandle) as? URL
                else { return URL(string: "") }
            return imageUrl
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectHandle, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func loadImageWithUrl(_ url: URL) {
        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        let session = URLSession(configuration: .default)
        
        let downloadPicTask = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error as Any)
                return
            }
            DispatchQueue.main.async(execute: {
                if let unwrappedData = data,
                    let imageToCache = UIImage(data: unwrappedData),
                    let imageUrl = self.imageUrl {
                    if imageUrl == url {
                        self.image = imageToCache
                    }
                    imageCache.setObject(imageToCache, forKey: url as AnyObject)
                }
            })
        }
        downloadPicTask.resume()
        
    }
}
