//
//  ProfileViewController.swift
//  AppChatClone
//
//  Created by NgocHap on 12/04/2022.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var viewBottom: UIView!
    @IBOutlet weak var viewInfor: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewBottom.roundCorners(corners: [.topLeft, .topRight], radius: 40)
        
        viewInfor.roundCorners(corners: [.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 20)
    }

}
