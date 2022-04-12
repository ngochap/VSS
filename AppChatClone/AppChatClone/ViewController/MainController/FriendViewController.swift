//
//  FriendViewController.swift
//  AppChatClone
//
//  Created by NgocHap on 12/04/2022.
//

import UIKit

class FriendViewController: UIViewController {

    @IBOutlet weak var viewBottom: UIView!
    @IBOutlet weak var viewMenu: UIView!
    
    let bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewBottom.roundCorners(corners: [.topLeft, .topRight], radius: 40)
        
        self.viewMenu.layer.borderWidth = 1
        self.viewMenu.layer.borderColor = hexStringToUIColor(hex: "999999").cgColor
        
    }
    private func setupLayout() {
        view.addSubview(bottomView)
        bottomView.topAnchor.constraint(equalTo: viewBottom.bottomAnchor).isActive = true
    }
}
