//
//  GrouplCollectionViewCell.swift
//  AppChatClone
//
//  Created by NgocHap on 12/04/2022.
//

import UIKit

class GrouplCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var viewImage: UIView!
    @IBOutlet weak var viewParent: UIView!
    @IBOutlet weak var lbName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewParent.layer.cornerRadius = 20
        img.layer.cornerRadius = img.frame.size.height / 2
    }

}
