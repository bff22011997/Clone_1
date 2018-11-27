//
//  Sub.swift
//  Project_1
//
//  Created by Trung Kiên on 11/23/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

import UIKit
import WebKit
class Sub: UIView {
   weak var save : UIViewController? = nil
    @IBOutlet weak var btnRestore: UIButton!
    @IBOutlet weak var webView: UIView!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet var view: UIView!
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var tv: UITextView!
    @IBOutlet weak var image: UIImageView!
    var webViewContent: WKWebView?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.red
        Bundle.main.loadNibNamed(Sub.name, owner: self, options: nil)
        add(view)
        webView.backgroundColor = UIColor.clear
        webViewContent = WKWebView(frame: webView.bounds)
        if let webViewContent = webViewContent {
            webViewContent.isOpaque = false
            webViewContent.scrollView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
            webViewContent.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
            webViewContent.navigationDelegate = self
            webView.add(webViewContent)
        }
        tv.text = ""

        btnStart.layer.cornerRadius = 20
       
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: btnStart.bounds.origin.x, y: btnStart.bounds.origin.y, width: UIScreen.main.bounds.width - 40, height: 40)
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5);
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5);
        gradient.colors = [UIColor.init(rgb: 0xffef43).cgColor, UIColor(rgb: 0xfd3998).cgColor]
        btnStart.layer.insertSublayer(gradient, at: 0)
       
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @IBAction func onStart(_ sender: Any) {
        
    }
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss()
    }
    
    @IBAction func onRestore(_ sender: Any) {
        
    }
}
extension Sub : WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let url = navigationAction.request.url?.absoluteString {
            if url != "about:blank" {
                decisionHandler(.cancel)
                guard let url = URL(string: url) else { return }
                UIApplication.shared.open(url)
            } else {
                decisionHandler(.allow)
            }
        }
    }
}

extension UIView {
    func applyGradient(colours: [UIColor]) -> Void {
        self.applyGradient(colours: colours, locations: nil)
    }
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.frame
        gradient.colors = colours.map { $0.cgColor }
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        self.layer.insertSublayer(gradient, at: 0)
    }
}
