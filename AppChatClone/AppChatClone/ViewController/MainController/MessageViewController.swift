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
    @IBOutlet weak var viewsearch: UIView!
    
    var arrChose: [Int] = []
    var indexSelct: Int = -1
    var arrSelcet = ["ngoc hap", "ngoc","hap","ngoc1","ngoc2","ngoc3"]
    var chose: Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        viewsearch.isHidden = true
        viewBottom.roundCorners(corners: [.topLeft, .topRight], radius: 40)
      //  topCollectionView.delegate = self
        topCollectionView.dataSource = self
        topCollectionView.delegate = self
        topCollectionView.register(UINib(nibName: "MessCLVCell", bundle: nil), forCellWithReuseIdentifier: "MessCLVCell")
        
        bottomTableView.dataSource = self
        bottomTableView.register(UINib(nibName: "MessTableViewCell", bundle: nil), forCellReuseIdentifier: "MessTableViewCell")
        setupLongGestureRecognizerOnCollection()
        navigationController?.navigationBar.isHidden = true
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.layoutSubviews()
    }
    @IBAction func btnChoseSearch(_ sender: Any) {
        if chose {
            viewsearch.isHidden = false
        } else {
            viewsearch.isHidden = true
        }
        chose = !chose
        UIView.animate(withDuration: 0.5) {
                   self.view.layoutIfNeeded()
//                   self.BGImageControl.image = UIImage.init(named: "BtnHome1")
               }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSelcet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MessTableViewCell") as? MessTableViewCell else {
            return UITableViewCell()
        }
        if indexSelct == indexPath.row {
//            if arrSelect.contains(indexPath.row) {
//                cell.imgCheck.image = UIImage(named: "ic_check")
//            } else {
//                cell.imgCheck.image = UIImage(named: "ic_uncheck")
//            }

            cell.checkView.isHidden = false
        } else {
            cell.checkView.isHidden = true
        }
        cell.lbName.text = arrSelcet[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        print("Deleted")

          arrSelcet.remove(at: indexPath.row)
        self.bottomTableView.deleteRows(at: [indexPath], with: .automatic)
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
            for i in 0..<indexPath.row {
                arrChose.append(i)

            }
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

