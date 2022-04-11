//
//  MessageViewController.swift
//  AppChatClone
//
//  Created by NgocHap on 11/04/2022.
//

import UIKit

class MessageViewController: UIViewController, UITableViewDataSource {
    
    

    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var viewBottom: UIView!
    @IBOutlet weak var bottomTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewBottom.roundCorners(corners: [.topLeft, .topRight], radius: 40)
      //  topCollectionView.delegate = self
        topCollectionView.dataSource = self
        topCollectionView.register(UINib(nibName: "MessCLVCell", bundle: nil), forCellWithReuseIdentifier: "MessCLVCell")
        
        bottomTableView.dataSource = self
        bottomTableView.register(UINib(nibName: "MessTableViewCell", bundle: nil), forCellReuseIdentifier: "MessTableViewCell")
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.layoutSubviews()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MessTableViewCell") as? MessTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }

}
extension MessageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MessCLVCell", for: indexPath) as? MessCLVCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    
}
extension MessageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: topCollectionView.bounds.width / 5, height: topCollectionView.frame.height)
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 100
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 100
//    }
}

