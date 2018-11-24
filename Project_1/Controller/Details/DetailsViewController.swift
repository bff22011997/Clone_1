//
//  DetailsViewController.swift
//  Project_1
//
//  Created by Trung Kiên on 11/19/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController {
    var indexSelected = 0
    let animanwalls = FileName.animanwalls.read(FileType.txt)
    let cities = FileName.cities.read(FileType.txt)
    let fishs = FileName.fishs.read(FileType.txt)
    let flowerwall = FileName.flowerwall.read(FileType.txt)
    let macro = FileName.macro.read(FileType.txt)
    let sexywall = FileName.sexywall.read(FileType.txt)
    var index = [IndexPath]()
    @IBOutlet weak var layoutHeight: NSLayoutConstraint!
    @IBOutlet weak var textCategory: UITextView!
    
    @IBOutlet weak var viewImageTop: UIView!
    @IBOutlet weak var imageHeader: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lblCategory: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewTop()
        collectionView.backgroundColor = UIColor.clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: "DetailsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DetailsCollectionViewCell")
    }

    @IBAction func onBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        index = [IndexPath]()
    }
    func setUpViewTop() {
        viewImageTop.backgroundColor = UIColor.clear
        viewImageTop.layer.borderWidth = 1
        viewImageTop.layer.borderColor = UIColor(rgb: 0x282f36).cgColor
        viewImageTop.layer.cornerRadius = 12;
        viewImageTop.clipsToBounds = true
        switch indexSelected {
        case 0:
            layoutHeight.constant = 80
            lblCategory.text = "Animals"
            textCategory.text = "This page provides you with a broad range of free to use animal pictures. All animal images are licensed under a CC0 license and can be downloaded for free and even be used for commercial purposes."
            imageHeader.downloaded(from: animanwalls[Int.random(in: 0..<animanwalls.count)].imageUrl ?? animanwalls[0].imageUrl!)
            break
        case 1:
            lblCategory.text = "Cities"
            textCategory.text = "Find the best street images and street photos. We selected these street pictures ourselves to ensure that all of them are of the highest quality."
            imageHeader.downloaded(from: cities[Int.random(in: 0..<cities.count)].imageUrl ?? cities[0].imageUrl!)
            break
        case 2:
            lblCategory.text = "Fishes"
            textCategory.text = "Find everything from tropical, saltwater to aquarium fish. Our gallery also includes fishing images and photography of meals containing fish."
            imageHeader.downloaded(from: fishs[Int.random(in: 0..<fishs.count)].imageUrl ?? fishs[0].imageUrl!)
            break
        case 3:
            lblCategory.text = "Flowers"
            textCategory.text = "Here you can find different types of flower pictures, among them red flowers, white flowers, rose flowers, spring flowers, flower wallpapers and other flower images."
            imageHeader.downloaded(from: flowerwall[Int.random(in: 0..<flowerwall.count)].imageUrl ?? flowerwall[0].imageUrl!)
            break
        case 4:
            lblCategory.text = "Marco"
            textCategory.text = "Extreme close-up photography, usually of very small subjects and living organisms like insects, in which the size of the subject in the photograph is greater than life size."
            imageHeader.downloaded(from: macro[Int.random(in: 0..<macro.count)].imageUrl ?? macro[0].imageUrl!)
            break
        case 5:
            lblCategory.text = "Sexy"
            textCategory.text = "Scroll through our selection of girl images and girl photos to find the perfect match for your needs."
            imageHeader.downloaded(from: sexywall[Int.random(in: 0..<sexywall.count)].imageUrl ?? sexywall[0].imageUrl!)
            break
        default:
            break
        }
        
    }
    

}
extension DetailsViewController : UICollectionViewDelegate {
    
}
extension DetailsViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch indexSelected {
        case 0:
            return animanwalls.count
        case 1:
            return cities.count
        case 2:
            return fishs.count
        case 3:
            return flowerwall.count
        case 4:
            return macro.count
        case 5:
            return sexywall.count
        default:
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailsCollectionViewCell", for: indexPath) as! DetailsCollectionViewCell
        cell.backgroundColor = UIColor.clear
        cell.imageAllOfCategory.layer.cornerRadius = 10
        cell.imageAllOfCategory.clipsToBounds = true
        switch indexSelected {
        case 0:
            cell.imageAllOfCategory.sd_setImage(with: URL(string: animanwalls[indexPath.row].imageUrl!), placeholderImage: UIImage(named: "placeholder.jpg"))

            break
        case 1:
            cell.imageAllOfCategory.sd_setImage(with: URL(string: cities[indexPath.row].imageUrl!), placeholderImage: UIImage(named: "placeholder.jpg"))
            break
        case 2:
            cell.imageAllOfCategory.sd_setImage(with: URL(string: fishs[indexPath.row].imageUrl!), placeholderImage: UIImage(named: "placeholder.jpg"))
            break
        case 3:
            cell.imageAllOfCategory.sd_setImage(with: URL(string: flowerwall[indexPath.row].imageUrl!), placeholderImage: UIImage(named: "placeholder.jpg"))
            break
        case 4:
            cell.imageAllOfCategory.sd_setImage(with: URL(string: macro[indexPath.row].imageUrl!), placeholderImage: UIImage(named: "placeholder.jpg"))
            break
        case 5:
            cell.imageAllOfCategory.sd_setImage(with: URL(string: sexywall[indexPath.row].imageUrl!), placeholderImage: UIImage(named: "placeholder.jpg"))
            break
        default:
            break
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let save = SaveViewController()
        switch indexSelected {
        case 0:
            save.linkImage = animanwalls[indexPath.row].imageUrl!
            break
        case 1:
            save.linkImage = cities[indexPath.row].imageUrl!
            break
        case 2:
            save.linkImage = fishs[indexPath.row].imageUrl!
            break
        case 3:
            save.linkImage = flowerwall[indexPath.row].imageUrl!
            break
        case 4:
            save.linkImage = macro[indexPath.row].imageUrl!
            break
        case 5:
            save.linkImage = sexywall[indexPath.row].imageUrl!
            break
        default:
            break
        }
        navigationController?.pushViewController(save, animated: true)
    }
}
extension DetailsViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:(UIScreen.main.bounds.width - 30) / 2, height: (UIScreen.main.bounds.width - 30) / 2 + 80)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
