//
//  MessageViewController.swift
//  AppChatClone
//
//  Created by NgocHap on 11/04/2022.
//

import UIKit

class MessageViewController: UIViewController, UITableViewDataSource, UIGestureRecognizerDelegate {
    
    

    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var viewBottom: UIView!
    @IBOutlet weak var bottomTableView: UITableView!
    
    var indexSelct: Int = -1
    let arrSelcet = ["ngoc hap", "ngoc","hap","ngoc1","ngoc2","ngoc3"]
    override func viewDidLoad() {
        super.viewDidLoad()
        viewBottom.roundCorners(corners: [.topLeft, .topRight], radius: 40)
      //  topCollectionView.delegate = self
        topCollectionView.dataSource = self
        topCollectionView.delegate = self
        topCollectionView.register(UINib(nibName: "MessCLVCell", bundle: nil), forCellWithReuseIdentifier: "MessCLVCell")
        
        bottomTableView.dataSource = self
        bottomTableView.register(UINib(nibName: "MessTableViewCell", bundle: nil), forCellReuseIdentifier: "MessTableViewCell")
        setupLongGestureRecognizerOnCollection()
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
        if indexSelct == indexPath.row {
            cell.checkView.isHidden = false
        }
        cell.lbName.text = arrSelcet[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        print("Deleted")

//          self.remove(at: indexPath.row)
//        self.bottomTableView.deleteRows(at: [indexPath], with: .automatic)
      }
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
    private func setupLongGestureRecognizerOnCollection() {
        let longPressedGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(gestureRecognizer:)))
        longPressedGesture.minimumPressDuration = 0.5
        longPressedGesture.delegate = self
        longPressedGesture.delaysTouchesBegan = true
        bottomTableView?.addGestureRecognizer(longPressedGesture)
    }
    
    @objc func handleLongPress(gestureRecognizer: UILongPressGestureRecognizer) {
        if (gestureRecognizer.state != .began) {
            return
        }
        let p = gestureRecognizer.location(in: bottomTableView)
        print(p)
        if let indexPath = bottomTableView?.indexPathForRow(at: p) {
            indexSelct = indexPath.row
            bottomTableView.reloadData()
        }
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

