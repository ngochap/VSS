//
//  FriendViewController.swift
//  AppChatClone
//
//  Created by NgocHap on 12/04/2022.
//

import UIKit

class FriendViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
   
    @IBOutlet weak var viewBottom: UIView!
    @IBOutlet weak var viewMenu: UIView!
    @IBOutlet weak var listCollection: UICollectionView!
    @IBOutlet weak var btnRequired: UIButton!
    @IBOutlet weak var btnAllFriend: UIButton!
    @IBOutlet weak var btnFriend: UIButton!
    
    var hori : NSLayoutConstraint?
    override func viewDidLoad() {
        super.viewDidLoad()
        viewBottom.roundCorners(corners: [.topLeft, .topRight], radius: 40)
        
        self.viewMenu.layer.borderWidth = 1
        self.viewMenu.layer.borderColor = hexStringToUIColor(hex: "999999").cgColor
        setupHorizonalBar()
        setUpCollectionView()
        defaultbt()
    }
    
    func setUpCollectionView() {
        listCollection.dataSource = self
        listCollection.delegate = self
        listCollection.isPagingEnabled = true
        listCollection.register(UINib(nibName: "FriendCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FriendCollectionViewCell")
        
        listCollection.isPagingEnabled = true
        if let flowLayout = listCollection.collectionViewLayout as? UICollectionViewFlowLayout{
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
    }
    
    func setupHorizonalBar(){
        
        let horizonal = UIView()
        horizonal.backgroundColor = hexStringToUIColor(hex: "5B71E2")
        horizonal.translatesAutoresizingMaskIntoConstraints = false
        viewMenu.addSubview(horizonal)
        
        horizonal.bottomAnchor.constraint(equalTo: viewMenu.bottomAnchor).isActive = true
        horizonal.widthAnchor.constraint(equalTo: viewMenu.widthAnchor, multiplier: 1/3.5).isActive = true
        horizonal.heightAnchor.constraint(equalToConstant: 4).isActive = true
        hori = horizonal.leftAnchor.constraint(equalTo: self.viewMenu.leftAnchor, constant: 10)
        
        hori?.isActive = true
    }
    //    func scrollMenuItemIndex(menuIndex: Int){
    //        let indexPath = NSIndexPath(item: menuIndex, section: 0)
    //        playCollection.scrollToItem(at: indexPath as IndexPath, at: [], animated: true)
    //    }
    func scrollMenuItemIndex(menuIndex: Int){
        let indexPath = NSIndexPath(item: menuIndex, section: 0)
        listCollection.scrollToItem(at: indexPath as IndexPath, at: [], animated: true)
    }
    var aqqq: CGFloat = 0.0
    @IBAction func clickList(_ sender: UIButton) {
        let x = CGFloat(sender.tag) * viewMenu.frame.width / 3 + 10
        //let x = 0
        aqqq = x
        hori?.constant = x
        scrollMenuItemIndex(menuIndex: sender.tag)
        UIView.animate(withDuration: 0.4, animations: {
            self.viewMenu.layoutIfNeeded()
        })
                switch sender.tag{
                    case 0:
                        defaultbt()
                    case 1:
                        btnFriend.setTitleColor(hexStringToUIColor(hex: "999999"), for: .normal)
                        btnAllFriend.setTitleColor(hexStringToUIColor(hex: "5B71E2"), for: .normal)
                        btnRequired.setTitleColor(hexStringToUIColor(hex: "999999"), for: .normal)
                       
                    case 2:
                        btnFriend.setTitleColor(hexStringToUIColor(hex: "999999"), for: .normal)
                        btnAllFriend.setTitleColor(hexStringToUIColor(hex: "999999"), for: .normal)
                        btnRequired.setTitleColor(hexStringToUIColor(hex: "5B71E2"), for: .normal)
                    default: break
                }
        
    }
    func  defaultbt(){
        btnFriend.setTitleColor(hexStringToUIColor(hex: "5B71E2"), for: .normal)
        btnAllFriend.setTitleColor(hexStringToUIColor(hex: "999999"), for: .normal)
        btnRequired.setTitleColor(hexStringToUIColor(hex: "999999"), for: .normal)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendCollectionViewCell", for: indexPath) as? FriendCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       
        hori?.constant = scrollView.contentOffset.x / 3 + 10
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print(targetContentOffset.pointee.x / viewMenu.frame.width)
        
        let index = Int(targetContentOffset.pointee.x / viewMenu.frame.width)
        if (index == 0){
            btnFriend.setTitleColor(hexStringToUIColor(hex: "5B71E2"), for: .normal)
            btnAllFriend.setTitleColor(hexStringToUIColor(hex: "999999"), for: .normal)
            btnRequired.setTitleColor(hexStringToUIColor(hex: "999999"), for: .normal)

        }else if (index == 1){
            btnFriend.setTitleColor(hexStringToUIColor(hex: "999999"), for: .normal)
            btnAllFriend.setTitleColor(hexStringToUIColor(hex: "5B71E2"), for: .normal)
            btnRequired.setTitleColor(hexStringToUIColor(hex: "999999"), for: .normal)

        }else {
            btnFriend.setTitleColor(hexStringToUIColor(hex: "999999"), for: .normal)
            btnAllFriend.setTitleColor(hexStringToUIColor(hex: "999999"), for: .normal)
            btnRequired.setTitleColor(hexStringToUIColor(hex: "5B71E2"), for: .normal)
        }
    }
}
extension FriendViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: listCollection.frame.width, height: listCollection.frame.height)
    }
}

