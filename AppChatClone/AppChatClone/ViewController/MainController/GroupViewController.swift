//
//  GroupViewController.swift
//  AppChatClone
//
//  Created by NgocHap on 12/04/2022.
//

import UIKit

class GroupViewController: UIViewController {

    @IBOutlet weak var viewBottom: UIView!
    @IBOutlet weak var groupCollectionView: UICollectionView!
    
    var arrSelcet = ["ngoc hap", "ngoc","hap","ngoc1","ngoc2","ngoc3","ngoc3","ngoc3","ngoc3","ngoc3"]
    override func viewDidLoad() {
        super.viewDidLoad()
        viewBottom.roundCorners(corners: [.topLeft, .topRight], radius: 40)
        groupCollectionView.dataSource = self
        groupCollectionView.delegate = self
        groupCollectionView.register(UINib(nibName: "GrouplCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GrouplCollectionViewCell")
        groupCollectionView.backgroundColor = hexStringToUIColor(hex: "#F5F5F5")
    }
    
}

extension GroupViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrSelcet.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GrouplCollectionViewCell", for: indexPath) as? GrouplCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.lbName.text = arrSelcet[indexPath.row]
        return cell
    }

}
extension GroupViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: groupCollectionView.frame.width, height: groupCollectionView.frame.height / 6)
    }
}
