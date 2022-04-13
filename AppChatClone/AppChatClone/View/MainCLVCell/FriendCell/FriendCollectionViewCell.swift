//
//  FriendCollectionViewCell.swift
//  AppChatClone
//
//  Created by NgocHap on 13/04/2022.
//

import UIKit

class FriendCollectionViewCell: UICollectionViewCell, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var detailTableView: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        SetUpTableView()
    }
    func SetUpTableView() {
        detailTableView.dataSource = self
        detailTableView.delegate = self
        detailTableView.register(UINib(nibName: "DetailFriendtableViewCell", bundle: nil), forCellReuseIdentifier: "DetailFriendtableViewCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailFriendtableViewCell") as? DetailFriendtableViewCell else {
            return UITableViewCell()
        }
      
       return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

