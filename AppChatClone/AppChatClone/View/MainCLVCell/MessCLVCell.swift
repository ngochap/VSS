//
//  MessCLVCell.swift
//  AppChatClone
//
//  Created by NgocHap on 11/04/2022.
//

import UIKit

class MessCLVCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imgAvatar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        imgAvatar.layer.cornerRadius = imgAvatar.frame.height / 2
        imgAvatar.layer.borderWidth = 1
        imgAvatar.layer.masksToBounds = false
        imgAvatar.layer.borderColor = UIColor.black.cgColor
        imgAvatar.layer.cornerRadius = imgAvatar.frame.height/2.6
        imgAvatar.clipsToBounds = true
    }

}
