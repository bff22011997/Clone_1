//
//  CustomeHomeView.swift
//  Project_1
//
//  Created by Trung Kiên on 11/22/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

import UIKit
import SnapKit
class CustomeHomeView: UIView {
    var custom : SaveViewController? = nil
    let viewStack : UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let view1 : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let ic_mail : UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        image.clipsToBounds = true
        image.image = UIImage(named: "Mail")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        
        return image
    }()
    let ic_calender : UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Calendar")
        return image
    }()
    let ic_photo : UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Photos")
        return image
    }()
    let ic_camera : UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Camera")
        return image
    }()
    
    let view2 : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let ic_map : UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        image.clipsToBounds = true
        image.image = UIImage(named: "Maps")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let ic_clock : UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Clock")
        return image
    }()
    let ic_weather : UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Weather")
        return image
    }()
    let ic_new : UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "News")
        return image
    }()
    let view3 : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let ic_home : UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        image.clipsToBounds = true
        image.image = UIImage(named: "Home")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let ic_note : UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Notes")
        return image
    }()
    let ic_stock : UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Stocks")
        return image
    }()
    let ic_remider : UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Reminders")
        return image
    }()
    
    let view4 : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let ic_tv : UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        image.clipsToBounds = true
        image.image = UIImage(named: "TV")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let ic_app : UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "App Store")
        return image
    }()
    let ic_itune : UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "iTunes Store")
        return image
    }()
    let ic_book : UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "iBooks")
        return image
    }()
    
    let view5 : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let ic_health : UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        image.clipsToBounds = true
        image.image = UIImage(named: "Health")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let ic_wallet : UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Wallet")
        return image
    }()
    let ic_setting : UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Settings")
        return image
    }()
    
    let view6 : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let ic_phone : UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        image.clipsToBounds = true
        image.image = UIImage(named: "Phone")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let ic_safari : UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Safari")
        return image
    }()
    let ic_messgae : UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Messages")
        return image
    }()
    let ic_music : UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Music")
        return image
    }()
    
    let btnCancel : UIButton = {
       let btn = UIButton(type: UIButton.ButtonType.system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("", for: .normal)
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(removeView), for: .touchUpInside)
        return btn
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(viewStack)
        addSubview(btnCancel)
        setUpView()
        

        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUpView() {
        viewStack.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(20)
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.bottom.equalTo(self).offset(-100)
        }
        viewStack.addSubview(view1)
        view1.snp.makeConstraints { (make) in
            make.top.equalTo(viewStack)
            make.left.equalTo(viewStack)
            make.right.equalTo(viewStack)
            make.height.equalTo(viewStack).dividedBy(5)
        }
        view1.addSubview(ic_mail)
        view1.addSubview(ic_calender)
        view1.addSubview(ic_photo)
        view1.addSubview(ic_camera)
        ic_mail.snp.makeConstraints { (make) in
            make.top.equalTo(view1).offset(10)
            make.left.equalTo(view1).offset(20)
            make.bottom.equalTo(view1).offset(-10)
            make.width.equalTo((self.frame.size.width - 100 ) / 4)
        }
        ic_calender.snp.makeConstraints { (make) in
            make.top.equalTo(view1).offset(10)
            make.left.equalTo(ic_mail.snp.right).offset(20)
            make.bottom.equalTo(view1).offset(-10)
            make.width.equalTo(ic_mail)
        }
        ic_photo.snp.makeConstraints { (make) in
            make.top.equalTo(view1).offset(10)
            make.left.equalTo(ic_calender.snp.right).offset(20)
            make.bottom.equalTo(view1).offset(-10)
            make.width.equalTo(ic_mail)
        }
        ic_camera.snp.makeConstraints { (make) in
            make.top.equalTo(view1).offset(10)
            make.left.equalTo(ic_photo.snp.right).offset(20)
            make.bottom.equalTo(view1).offset(-10)
            make.width.equalTo(ic_mail)
        }
        
        viewStack.addSubview(view2)
        view2.snp.makeConstraints { (make) in
            make.top.equalTo(view1.snp.bottom)
            make.left.equalTo(viewStack)
            make.right.equalTo(viewStack)
            make.height.equalTo(view1)
        }
        view2.addSubview(ic_map)
        view2.addSubview(ic_clock)
        view2.addSubview(ic_weather)
        view2.addSubview(ic_new)
        ic_map.snp.makeConstraints { (make) in
            make.top.equalTo(view2).offset(10)
            make.left.equalTo(view2).offset(20)
            make.bottom.equalTo(view2).offset(-10)
            make.width.equalTo((self.frame.size.width - 100 ) / 4)
        }
        ic_clock.snp.makeConstraints { (make) in
            make.top.equalTo(view2).offset(10)
            make.left.equalTo(ic_map.snp.right).offset(20)
            make.bottom.equalTo(view2).offset(-10)
            make.width.equalTo(ic_map)
        }
        ic_weather.snp.makeConstraints { (make) in
            make.top.equalTo(view2).offset(10)
            make.left.equalTo(ic_clock.snp.right).offset(20)
            make.bottom.equalTo(view2).offset(-10)
            make.width.equalTo(ic_clock)
        }
        ic_new.snp.makeConstraints { (make) in
            make.top.equalTo(view2).offset(10)
            make.left.equalTo(ic_weather.snp.right).offset(20)
            make.bottom.equalTo(view2).offset(-10)
            make.width.equalTo(ic_weather)
        }
        
        viewStack.addSubview(view3)
        view3.snp.makeConstraints { (make) in
            make.top.equalTo(view2.snp.bottom)
            make.left.equalTo(viewStack)
            make.right.equalTo(viewStack)
            make.height.equalTo(view2)
        }
        view3.addSubview(ic_home)
        view3.addSubview(ic_note)
        view3.addSubview(ic_stock)
        view3.addSubview(ic_remider)
        ic_home.snp.makeConstraints { (make) in
            make.top.equalTo(view3).offset(10)
            make.left.equalTo(view3).offset(20)
            make.bottom.equalTo(view3).offset(-10)
            make.width.equalTo((self.frame.size.width - 100 ) / 4)
        }
        ic_note.snp.makeConstraints { (make) in
            make.top.equalTo(view3).offset(10)
            make.left.equalTo(ic_home.snp.right).offset(20)
            make.bottom.equalTo(view3).offset(-10)
            make.width.equalTo(ic_home)
        }
        ic_stock.snp.makeConstraints { (make) in
            make.top.equalTo(view3).offset(10)
            make.left.equalTo(ic_note.snp.right).offset(20)
            make.bottom.equalTo(view3).offset(-10)
            make.width.equalTo(ic_note)
        }
        ic_remider.snp.makeConstraints { (make) in
            make.top.equalTo(view3).offset(10)
            make.left.equalTo(ic_stock.snp.right).offset(20)
            make.bottom.equalTo(view3).offset(-10)
            make.width.equalTo(ic_stock)
        }
        
        viewStack.addSubview(view4)
        view4.snp.makeConstraints { (make) in
            make.top.equalTo(view3.snp.bottom)
            make.left.equalTo(viewStack)
            make.right.equalTo(viewStack)
            make.height.equalTo(view3)
        }
        view4.addSubview(ic_tv)
        view4.addSubview(ic_app)
        view4.addSubview(ic_itune)
        view4.addSubview(ic_book)
        ic_tv.snp.makeConstraints { (make) in
            make.top.equalTo(view4).offset(10)
            make.left.equalTo(view4).offset(20)
            make.bottom.equalTo(view4).offset(-10)
            make.width.equalTo((self.frame.size.width - 100 ) / 4)
        }
        ic_app.snp.makeConstraints { (make) in
            make.top.equalTo(view4).offset(10)
            make.left.equalTo(ic_tv.snp.right).offset(20)
            make.bottom.equalTo(view4).offset(-10)
            make.width.equalTo(ic_tv)
        }
        ic_itune.snp.makeConstraints { (make) in
            make.top.equalTo(view4).offset(10)
            make.left.equalTo(ic_app.snp.right).offset(20)
            make.bottom.equalTo(view4).offset(-10)
            make.width.equalTo(ic_app)
        }
        ic_book.snp.makeConstraints { (make) in
            make.top.equalTo(view4).offset(10)
            make.left.equalTo(ic_itune.snp.right).offset(20)
            make.bottom.equalTo(view4).offset(-10)
            make.width.equalTo(ic_itune)
        }
        
        viewStack.addSubview(view5)
        view5.snp.makeConstraints { (make) in
            make.top.equalTo(view4.snp.bottom)
            make.left.equalTo(viewStack)
            make.right.equalTo(viewStack)
            make.height.equalTo(view4)
        }
        view5.addSubview(ic_health)
        view5.addSubview(ic_wallet)
        view5.addSubview(ic_setting)
        
        ic_health.snp.makeConstraints { (make) in
            make.top.equalTo(view5).offset(10)
            make.left.equalTo(view5).offset(20)
            make.bottom.equalTo(view5).offset(-10)
            make.width.equalTo((self.frame.size.width - 100 ) / 4)
        }
        ic_wallet.snp.makeConstraints { (make) in
            make.top.equalTo(view5).offset(10)
            make.left.equalTo(ic_health.snp.right).offset(20)
            make.bottom.equalTo(view5).offset(-10)
            make.width.equalTo(ic_health)
        }
        ic_setting.snp.makeConstraints { (make) in
            make.top.equalTo(view5).offset(10)
            make.left.equalTo(ic_wallet.snp.right).offset(20)
            make.bottom.equalTo(view5).offset(-10)
            make.width.equalTo(ic_wallet)
        }
        
        self.addSubview(view6)
        view6.snp.makeConstraints { (make) in
            make.height.equalTo(view4)
            make.left.equalTo(viewStack)
            make.right.equalTo(viewStack)
            make.bottom.equalTo(self)
        }
        view6.addSubview(ic_phone)
        view6.addSubview(ic_safari)
        view6.addSubview(ic_messgae)
        view6.addSubview(ic_music)
        ic_phone.snp.makeConstraints { (make) in
            make.top.equalTo(view6).offset(10)
            make.left.equalTo(view6).offset(20)
            make.bottom.equalTo(view6).offset(-10)
            make.width.equalTo((self.frame.size.width - 100 ) / 4)
        }
        ic_safari.snp.makeConstraints { (make) in
            make.top.equalTo(view6).offset(10)
            make.left.equalTo(ic_phone.snp.right).offset(20)
            make.bottom.equalTo(view6).offset(-10)
            make.width.equalTo(ic_phone)
        }
        ic_messgae.snp.makeConstraints { (make) in
            make.top.equalTo(view6).offset(10)
            make.left.equalTo(ic_safari.snp.right).offset(20)
            make.bottom.equalTo(view6).offset(-10)
            make.width.equalTo(ic_safari)
        }
        ic_music.snp.makeConstraints { (make) in
            make.top.equalTo(view6).offset(10)
            make.left.equalTo(ic_messgae.snp.right).offset(20)
            make.bottom.equalTo(view6).offset(-10)
            make.width.equalTo(ic_messgae)
        }
        
        btnCancel.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.bottom.equalTo(self)
        }
        
        
    }
    @objc func removeView() {
        custom?.viewHome.removeFromSuperview()
        custom?.viewButtonSave.isHidden = false
        custom?.viewButtonEdit.isHidden = false
        custom?.viewButtonHome.isHidden = false
        custom?.btnBack.isHidden = false
        custom?.imageBack.isHidden = false
    }
    
}
