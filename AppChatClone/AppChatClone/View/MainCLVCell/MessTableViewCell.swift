//
//  MessTableViewCell.swift
//  AppChatClone
//
//  Created by NgocHap on 11/04/2022.
//

import UIKit

class MessTableViewCell: UITableViewCell {

    @IBOutlet weak var imgAvatar: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imgAvatar.layer.cornerRadius = imgAvatar.frame.width / 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
