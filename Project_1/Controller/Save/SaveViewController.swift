//
//  SaveViewController.swift
//  Project_1
//
//  Created by Trung Kiên on 11/19/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage
class SaveViewController: UIViewController {
    @IBOutlet weak var imageEditText: UITextView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var imageBack: UIImageView!
    
    @IBOutlet weak var editTextView: UITextView!
    @IBOutlet weak var image_note: UIImageView!
    @IBOutlet weak var imageScreen: UIImageView!
    @IBOutlet weak var view_edit: UIView!
    
    @IBOutlet weak var layoutWidth: NSLayoutConstraint!
    @IBOutlet weak var layoutLeading: NSLayoutConstraint!
    @IBOutlet weak var layoutTop: NSLayoutConstraint!
    @IBOutlet weak var layoutBottom: NSLayoutConstraint!
    @IBOutlet weak var layoutTrailing: NSLayoutConstraint!
    
    var isShowViewEdit = true
    var imagePicker: UIImagePickerController!
    var linkImage = ""
    let viewButtonHome : UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 16
        return view
    }()
    
    let viewButtonSave : UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.green
        view.layer.cornerRadius = 16
        return view
    }()
    
    let viewButtonEdit : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 16
        return view
    }()
    
    let btnHome : UIButton = {
        let bt = UIButton(type: UIButton.ButtonType.system)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("", for: .normal)
        bt.addTarget(self, action: #selector(onHome), for: .touchUpInside)
        return bt
    }()
    let btnEdit : UIButton = {
        let bt = UIButton(type: UIButton.ButtonType.system)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("", for: .normal)
        bt.addTarget(self, action: #selector(onEdit), for: .touchUpInside)
        return bt
    }()
    let btnSave : UIButton = {
        let bt = UIButton(type: UIButton.ButtonType.system)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("", for: .normal)
        bt.addTarget(self, action: #selector(onSave), for: .touchUpInside)
        return bt
    }()
    let imageHome : UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "ic_home")
        return image
    }()
    let imageSave : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "ic_save")
        return image
    }()
    let imageEdit : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "ic_edit")
        return image
    }()

    
    lazy var viewHome = IOSHomeView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    
    enum ImageSource {
        case photoLibrary
        case camera
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(viewButtonHome)
        view.addSubview(viewButtonEdit)
        view.addSubview(viewButtonSave)
        // Do any additional setup after loading the view.
        setUpView()
        //imageScreen.downloaded(from: linkImage)
        imageScreen.sd_setImage(with: URL(string: linkImage), placeholderImage: UIImage(named: "placeholder.jpg"))
        view_edit.isHidden = true
        editTextView.text = ""
        editTextView.textColor = UIColor(rgb: 0x05101A)
        editTextView.delegate = self
        btnBack.layer.cornerRadius = 8
        imageScreen.isUserInteractionEnabled = true
        imageScreen.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hiddenKeyboard)))
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: "NoteCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NoteCollectionViewCell")
        collectionView.isHidden = true
        layoutWidth.constant = (UIScreen.main.bounds.width - 100 ) / 3
        
    }
    @objc func hiddenKeyboard() {
        self.view.endEditing(true)
        collectionView.isHidden = true
        //view_edit.isHidden = true
    }
    @IBAction func getImage(_ sender: Any) {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            selectImageFrom(.photoLibrary)
            return
        }
        selectImageFrom(.camera)
    }
    func selectImageFrom(_ source: ImageSource){
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        switch source {
        case .camera:
            imagePicker.sourceType = .camera
        case .photoLibrary:
            imagePicker.sourceType = .photoLibrary
        }
        present(imagePicker, animated: true, completion: nil)
    }

    @IBAction func onBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    func setUpView() {
        viewButtonHome.snp.makeConstraints { (make) in
            make.bottom.equalTo(-25)
            make.left.equalTo(25)
            make.height.equalTo(60)
            make.width.equalTo((UIScreen.main.bounds.width - 100 ) / 3)
        }
        viewButtonEdit.snp.makeConstraints { (make) in
            make.bottom.equalTo(-25)
            make.right.equalTo(-25)
            make.height.equalTo(60)
            make.width.equalTo((UIScreen.main.bounds.width - 100 ) / 3)
        }
        viewButtonSave.snp.makeConstraints { (make) in
            make.bottom.equalTo(-25)
            make.left.equalTo(viewButtonHome.snp.right).offset(25)
            make.height.equalTo(60)
            make.width.equalTo((UIScreen.main.bounds.width - 100 ) / 3)
        }
        viewButtonHome.addSubview(btnHome)
        btnHome.snp.makeConstraints { (make) in
            make.top.equalTo(viewButtonHome)
            make.left.equalTo(viewButtonHome)
            make.right.equalTo(viewButtonHome)
            make.bottom.equalTo(viewButtonHome)
        }
        viewButtonHome.addSubview(imageHome)
        imageHome.snp.makeConstraints { (make) in
            make.centerX.equalTo(btnHome)
            make.centerY.equalTo(btnHome)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        viewButtonEdit.addSubview(btnEdit)
        btnEdit.snp.makeConstraints { (make) in
            make.top.equalTo(viewButtonEdit)
            make.left.equalTo(viewButtonEdit)
            make.right.equalTo(viewButtonEdit)
            make.bottom.equalTo(viewButtonEdit)
        }
        viewButtonEdit.addSubview(imageEdit)
        imageEdit.snp.makeConstraints { (make) in
            make.centerX.equalTo(btnEdit)
            make.centerY.equalTo(btnEdit)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        viewButtonSave.addSubview(btnSave)
        btnSave.snp.makeConstraints { (make) in
            make.top.equalTo(viewButtonSave)
            make.left.equalTo(viewButtonSave)
            make.right.equalTo(viewButtonSave)
            make.bottom.equalTo(viewButtonSave)
        }
        viewButtonSave.addSubview(imageSave)
        imageSave.snp.makeConstraints { (make) in
            make.centerX.equalTo(btnSave)
            make.centerY.equalTo(btnSave)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
    }
    func textToImage(drawText text: String, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
        let textColor = UIColor(rgb: 0x05101A)
        let textFont = UIFont.systemFont(ofSize: 12)
        UIGraphicsBeginImageContextWithOptions(imageScreen.frame.size, false, 3.0)
        
        let textFontAttributes = [
            NSAttributedString.Key.font: textFont,
            NSAttributedString.Key.foregroundColor: textColor,
            ] as [NSAttributedString.Key : Any]
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
        var rect = CGRect()
        if image_note.image == UIImage(named: "image_edit_text.png") {
             rect = CGRect(x: view_edit.frame.origin.x + 10, y: view_edit.frame.origin.y + 10, width: view_edit.frame.size.width - 20, height: view_edit.frame.size.height - 50)
        }
        else if image_note.image == UIImage(named: "image_note1.png") {
            rect = CGRect(x: view_edit.frame.origin.x + 35, y: view_edit.frame.origin.y + 40, width: view_edit.frame.size.width - 50, height: view_edit.frame.size.height - 50)
        }
        else {
            rect = CGRect(x: view_edit.frame.origin.x + 10, y: view_edit.frame.origin.y + 35, width: view_edit.frame.size.width - 35, height: view_edit.frame.size.height - 75)
        }
        text.draw(in: rect, withAttributes: textFontAttributes)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    
    @objc func onHome() {
        viewHome.custom = self
        viewButtonHome.isHidden = true
        viewButtonEdit.isHidden = true
        viewButtonSave.isHidden = true
        btnBack.isHidden = true
        isShowViewEdit = true
        imageBack.isHidden = true
        view_edit.isHidden = true
        view.addSubview(viewHome)
        
    }
    @objc func onEdit() {
        UIView.animate(withDuration: 0.3) {
            self.collectionView.isHidden = false
        }
        
        
    }
    @objc func onSave() {
//        let image = UIImage.imageByMergingImages(topImage: image_note.image! , bottomImage: (self.imageScreen.image!), viewImageFront: self.view_edit, viewImageBottom: (self.view)!)
//
//        let imageAddImage = image
//
//        self.imageScreen.image = self.textToImage(drawText: self.editTextView.text, inImage: imageAddImage, atPoint: .zero)
//
//        self.view_edit.isHidden = !self.isShowViewEdit
//
//        guard let selectedImage = self.imageScreen.image else {
//            print("Image not found!")
//            return
//        }
//        UIImageWriteToSavedPhotosAlbum(selectedImage, self, #selector(self.image(_:didFinishSavingWithError:contextInfo:)), nil)
        self.checkSubscription(MetaHold.purchaseID.stringValue) { [weak self] success in
            if !success {
                self?.purchaseSubscription()
            }
            else {
                if ((self?.view_edit.isHidden)!) {
                    guard let selectedImage = self?.imageScreen.image else {
                        print("Image not found!")
                        return
                    }
                    UIImageWriteToSavedPhotosAlbum(selectedImage, self, #selector(self?.image(_:didFinishSavingWithError:contextInfo:)), nil)
                }
                else {
                    let image = UIImage.imageByMergingImages(topImage: (self?.image_note.image)! , bottomImage: (self?.imageScreen.image!)!, viewImageFront: self!.view_edit, viewImageBottom: (self?.view)!)

                    let imageAddImage = image
                    self!.imageScreen.image = self?.textToImage(drawText: self!.editTextView.text, inImage: imageAddImage, atPoint: .zero)

                    self!.view_edit.isHidden = !self!.isShowViewEdit

                    guard let selectedImage = self!.imageScreen.image else {
                        print("Image not found!")
                        return
                    }
                    UIImageWriteToSavedPhotosAlbum(selectedImage, self, #selector(self!.image(_:didFinishSavingWithError:contextInfo:)), nil)
                }
           }
        }
        
        
    }
    @objc func cancel() {
        
    }
    //MARK: - Add image to Library
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            showAlertWith(title: "Save error", message: error.localizedDescription)
        } else {
            showAlertWith(title: "Saved!", message: "Your image has been saved to your photos.")
        }
    }
    
    func showAlertWith(title: String, message: String){
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }

}
extension SaveViewController : UICollectionViewDelegate {
    
}
extension SaveViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NoteCollectionViewCell", for: indexPath) as! NoteCollectionViewCell
        if indexPath.row == 0 {
            cell.imageNote.image = UIImage(named: "image_edit_text.png")
        }
        else if indexPath.row == 1 {
            cell.imageNote.image = UIImage(named: "image_note1.png")
        }
        else {
            cell.imageNote.image = UIImage(named: "image_note2.png")
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            image_note.image = UIImage(named: "image_edit_text.png")
            layoutTop.constant = 10
            layoutLeading.constant = 10
            layoutBottom.constant = 10
            layoutTrailing.constant = 10
        }
        else if indexPath.row == 1 {
            layoutTop.constant = 35
            layoutLeading.constant = 40
            layoutBottom.constant = 20
            layoutTrailing.constant = 15
            image_note.image = UIImage(named: "image_note1.png")
        }
        else {
            image_note.image = UIImage(named: "image_note2.png")
            layoutTop.constant = 20
            layoutLeading.constant = 10
            layoutBottom.constant = 20
            layoutTrailing.constant = 15
        }
        isShowViewEdit = !isShowViewEdit
        view_edit.isHidden = false
        editTextView.text = ""
        collectionView.isHidden = true
    }
}
extension SaveViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - 100 ) / 3, height: 80)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
extension SaveViewController : UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
       let hight = textView.text!.height(withConstrainedWidth: textView.frame.width, font: UIFont.systemFont(ofSize: 12))
        
        let numLines = (textView.contentSize.height / (textView.font?.lineHeight)!)
        let f = Float(numLines)
        var s = Int(f)
        let e = Int(f * 10) % 10
        if (e > 5) {
            s = s + 1
        }
        if image_note.image == UIImage(named: "image_note1.png") {
            layoutLeading.constant = CGFloat(40 - Float((s - 1)) * 0.5)
        }
        print(s)
        if hight > 100 {
            let alert = UIAlertController(title: "Notification", message: "Text is too long ", preferredStyle: .alert)
            let okBtn = UIAlertAction(title: "OK", style: .default) { (action) in
                self.dismiss(animated: true, completion: nil)
            }
            alert.addAction(okBtn)

            editTextView.text.remove(at: editTextView.text.index(before: editTextView.text.endIndex))
            present(alert, animated: true, completion: nil)
        }
        
    }
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return true
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        
    }
}
extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.height)
    }
}
extension SaveViewController: UIImagePickerControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        imagePicker.dismiss(animated: true, completion: nil)
        guard let selectedImage = info[.originalImage] as? UIImage else {
            print("Image not found!")
            return
        }
        imageScreen.image = selectedImage
    }
}
extension SaveViewController : UINavigationControllerDelegate {
    
}
extension UIImage {
    
    static func imageByMergingImages(topImage: UIImage, bottomImage: UIImage, viewImageFront : UIView , viewImageBottom : UIView) -> UIImage {
        let size = viewImageBottom.frame.size
        UIGraphicsBeginImageContextWithOptions(size, false, 2.0)
        UIGraphicsGetCurrentContext()!.interpolationQuality = .high
        bottomImage.draw(in: viewImageBottom.frame)
        topImage.draw(in: viewImageFront.frame , blendMode: .normal, alpha: 1.0)
        
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
    
}
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

