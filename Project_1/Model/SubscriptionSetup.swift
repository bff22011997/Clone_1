//
//  SubscriptionSetup.swift
//  Project_1
//
//  Created by Trung Kiên on 11/23/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

import UIKit
import SwiftyStoreKit

enum HTMLKey: String {
    case backgroundColor = "[backgroundColor]"
    case linkColor = "[linkColor]"
    case weekPrice = "[weekPrice]"
    case yearPrice = "[yearPrice]"
    case privacyPolicy = "[privacyPolicy]"
    case subscriptionContent = "The app includes the following subscription options:<br>Weekly for [weekPrice] and Yearly for [yearPrice] will unlock all categories(including Timelapse, Nature, Animal and Others), fastlane review privilege for uploading original works.<br>Payment will be charged to iTunes Account at confirmation of purchase (if trial is activated, account will be charged after it's over).<br>Subscription automatically renews unless auto-renews is turn off at least 24-hours before the end of the current period.<br>Account will be charged for renewal within 24-hours prior to the end of the current period.<br>Subscription may be managed by user and auto-renewal may be turn off by going to the user's Account Setting after purchase.Please visit <a href=\"https://support.apple.com/en-us/HT202039\">https://support.apple.com/en-us/HT202039</a> for more information.<br>No cancellation of the current subscription is allowed during active subscription period.<br>Any unused portion of a free trial period, if offered, will be forfeited when the user purchases a subscription to that publication where applicable. For more information please visit:<br> [privacyPolicy]"
}

enum SubscriptionMessage: String {
    case title = "Subscription!"
    case buySuccess = "Payment successful, thank you for using our products!"
    case buyFail = "Purchase failed, please connect to the internet and try again."
    case restoreSuccess = "Restore purchases successful, thank you for using our products!"
    case restoreFail = "Restoring purchases failed, you don't have any purchases."
}

extension Subscription {
    func getPrice(_ handle: ((String?, String?) -> Void)?) {
        SwiftyStoreKit.retrieveProductsInfo([self.rawValue]) { result in
            if let product = result.retrievedProducts.first {
                var trial = ""
                if let period = product.introductoryPrice?.subscriptionPeriod {
                    trial = "\(period.numberOfUnits) \(unitName(unitRawValue: period.unit.rawValue)) free trial"
                }
                handle?(product.localizedPrice, trial)
            } else {
                handle?(nil, nil)
            }
        }
    }
    
    func buy(_ handle: ((Bool) -> Void)?) {
        SwiftyStoreKit.purchaseProduct(self.rawValue, quantity: 1, atomically: true) { result in
            switch result {
            case .success(_):
                MetaHold.isPurchase.save(true)
                handle?(true)
            case .error(_):
                handle?(false)
            }
        }
    }
    
    static func verify(_ productId: String, _ handle: ((Bool) -> Void)?) {
        let appleValidator = AppleReceiptValidator(service: .production, sharedSecret: Subscription.sharedSecret.rawValue)
        SwiftyStoreKit.verifyReceipt(using: appleValidator) { result in
            switch result {
            case .success(let receipt):
                let purchaseResult = SwiftyStoreKit.verifySubscription(
                    ofType: .autoRenewable,
                    productId: productId,
                    inReceipt: receipt)
                
                switch purchaseResult {
                case .purchased(_, _):
                    handle?(true)
                case .expired(_, _):
                    handle?(false)
                case .notPurchased:
                    handle?(false)
                }
            case .error(_):
                handle?(false)
            }
        }
    }
}

func unitName(unitRawValue:UInt) -> String {
    switch unitRawValue {
    case 0: return "days"
    case 1: return "weeks"
    case 2: return "months"
    case 3: return "years"
    default: return ""
    }
}

extension UIViewController {
    func purchaseSubscription() {
        let view = Sub(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.save = self
        
        let content = Variable<String>(HTMLKey.subscriptionContent.rawValue)
        let privacyPolicy = "<a href=\"\(Subscription.privacyPolicy.rawValue)\">Privacy Policy</a>"
        let termsOfService = "<a href=\"\(Subscription.termsOfService.rawValue)\">Terms of Service</a>"
        let backgroundColor = "#FFFFFF"
        let linkColor = "#75FFBD"
        
        Subscription.weekly.getPrice { [weak self] price, trial in
            if let price = price {
               // view.labelWeeklyPrice.text = price
                content.value = content.value.replacingOccurrences(of: HTMLKey.weekPrice.rawValue,
                                                                   with: price + ((trial ?? "") != "" ? " with \((trial ?? "")) " : ""))
                view.btnStart.handle {
                   // Loader.share.start()
                    Subscription.weekly.buy({ success in
                       // Loader.share.stop()
                        if success {
                            view.dismiss()
                            MetaHold.purchaseID.save(Subscription.weekly.rawValue)
                            self?.add(SubscriptionMessage.title.rawValue,
                                      message: SubscriptionMessage.buySuccess.rawValue)
                        } else {
                            self?.add(SubscriptionMessage.title.rawValue,
                                      message: SubscriptionMessage.buyFail.rawValue)
                        }
                    })
                }
            }
        }
        
        content.bind {  value in
            let html = content.value
                .replacingOccurrences(of: HTMLKey.privacyPolicy.rawValue, with: "<br><br><center>\(privacyPolicy) and \(termsOfService)</center>")
                .inHTML()
                .replacingOccurrences(of: HTMLKey.backgroundColor.rawValue, with: backgroundColor)
                .replacingOccurrences(of: HTMLKey.linkColor.rawValue, with: linkColor)
            view.webViewContent?.loadHTMLString(html, baseURL: nil)
        }
        
        view.btnRestore.handle { [weak self] in
          //  Loader.share.start()
            self?.restoreLastSubscription({ success in
               // Loader.share.stop()
                if success {
                    view.dismiss()
                    self?.add(SubscriptionMessage.title.rawValue,
                              message: SubscriptionMessage.restoreSuccess.rawValue)
                } else {
                    self?.add(SubscriptionMessage.title.rawValue,
                              message: SubscriptionMessage.restoreFail.rawValue)
                }
            })
        }
        view.btnStart.handle {
            
            Subscription.weekly.buy({ success in
                if success {
                    view.dismiss()
                    MetaHold.purchaseID.save(Subscription.weekly.rawValue)
                    self.add(SubscriptionMessage.title.rawValue,
                              message: SubscriptionMessage.buySuccess.rawValue)
                } else {
                    self.add(SubscriptionMessage.title.rawValue,
                              message: SubscriptionMessage.buyFail.rawValue)
                }
            })
        }
        
        
        add(view)
    }
    
    func restoreLastSubscription(_ handle: ((Bool) -> Void)?) {
        SwiftyStoreKit.restorePurchases(atomically: true) { results in
            if results.restoredPurchases.count > 0 {
                if let last = results.restoredPurchases.sorted(by: { (p1, p2) -> Bool in
                    return (p1.transaction.transactionDate ?? Date()) < (p2.transaction.transactionDate ?? Date())
                }).last {
                    if !last.needsFinishTransaction {
                        self.checkSubscription(last.productId, { success in
                            handle?(success)
                        })
                    } else {
                        handle?(false)
                    }
                }
            } else {
                handle?(false)
            }
        }
    }
    
    func checkSubscription(_ purchaseID: String,_ handle: ((Bool) -> Void)?) {
        if purchaseID != "" {
            Subscription.verify(purchaseID) { [weak self] success in
                if !success {
                    self?.purchaseSubscription()
                }
                MetaHold.isPurchase.save(success)
                MetaHold.purchaseID.save(purchaseID)
                handle?(success)
            }
        } else {
            handle?(false)
        }
    }
}

