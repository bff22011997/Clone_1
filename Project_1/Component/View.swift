//
//  View.swift
//  Project_1
//
//  Created by Trung Kiên on 11/23/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//


import UIKit
import WebKit

@IBDesignable class View: SpringView {
    
    var shadowLayer: CAShapeLayer?
    var gradientLayer: CAGradientLayer?
    
    @IBInspectable var gradient: Bool = false {
        didSet {
            layer.masksToBounds = gradient
        }
    }
    @IBInspectable var fromColor: UIColor = UIColor.clear
    @IBInspectable var toColor: UIColor = UIColor.clear
    @IBInspectable var shadow: Bool = false
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if shadow {
            
            layer.masksToBounds = false
            
            if shadowLayer == nil {
                shadowLayer = CAShapeLayer()
                shadowLayer?.fillColor = backgroundColor?.cgColor
                shadowLayer?.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
                shadowLayer?.shadowPath = shadowLayer?.path
                shadowLayer?.shadowOffset = CGSize(width: -1, height: 1.0)
                shadowLayer?.shadowOpacity = 0.5
                shadowLayer?.shadowRadius = 2
                if let shadowLayer = shadowLayer {
                    layer.insertSublayer(shadowLayer, at: 0)
                }
                //layer.insertSublayer(shadowLayer, below: nil) // also works
            }
        }
        
        if gradient {
            if gradientLayer == nil {
                gradientLayer = CAGradientLayer()
                
                if let gradientLayer = gradientLayer {
                    gradientLayer.frame = bounds
                    gradientLayer.colors = [fromColor.cgColor, toColor.cgColor]
                    layer.insertSublayer(gradientLayer, at: 0)
                }
            }
        }
    }
    
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        shadowLayer?.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
    }
    
}

extension UIView {
    @IBInspectable var masksToBounds: Bool {
        get { return layer.masksToBounds }
        set { layer.masksToBounds = newValue }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get { return layer.borderColor.map(UIColor.init) }
        set { layer.borderColor = newValue?.cgColor }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue; layer.masksToBounds = newValue > 0 }
    }
    
    func add(_ view: UIView, inset: UIEdgeInsets) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-\(inset.left)-[view]-\(inset.right)-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["view": view]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-\(inset.top)-[view]-\(inset.bottom)-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["view": view]))
    }
    
}

