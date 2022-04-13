//
//  DetailFriendtableViewCell.swift
//  AppChatClone
//
//  Created by NgocHap on 13/04/2022.
//

import UIKit

class DetailFriendtableViewCell: UITableViewCell {

    @IBOutlet weak var btnAddFriend: UIButton!
    @IBOutlet weak var imgFriend: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imgFriend.layer.cornerRadius = imgFriend.frame.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
