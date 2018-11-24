//
//  HomeViewController.swift
//  Project_1
//
//  Created by Trung Kiên on 11/19/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    let listNameCategory = ["Animal","Cities","Fish","Flowers","Macro","Sexy"]    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        
    }
}
extension HomeViewController : UICollectionViewDelegate {
    
}
extension HomeViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
       // cell.lblNameCategory.text = listNameCategory[indexPath.row]
        let category = MetaData.share.categories[indexPath.row]
        cell.imageCategory.layer.cornerRadius = 8
        cell.imageCategory.clipsToBounds = true
        cell.lblNameCategory.text = category.name
        cell.imageCategory.image = UIImage(named: category.imageUrl!)
        cell.iconCategory.image = UIImage(named: category.icon!)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let details = DetailsViewController()
        details.indexSelected = Int(indexPath.row)
        navigationController?.pushViewController(details, animated: true)
    }
}
extension HomeViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - 60) / 2, height: (UIScreen.main.bounds.width - 60) / 2 + 20)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
