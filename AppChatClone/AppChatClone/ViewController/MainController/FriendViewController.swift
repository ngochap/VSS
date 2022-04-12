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
    
    var hori : NSLayoutConstraint?
    override func viewDidLoad() {
        super.viewDidLoad()
        viewBottom.roundCorners(corners: [.topLeft, .topRight], radius: 40)
        
        self.viewMenu.layer.borderWidth = 1
        self.viewMenu.layer.borderColor = hexStringToUIColor(hex: "999999").cgColor
        setupHorizonalBar()
    }
    func setupHorizonalBar(){
        
        let horizonal = UIView()
        horizonal.backgroundColor = hexStringToUIColor(hex: "5B71E2")
        horizonal.translatesAutoresizingMaskIntoConstraints = false
        viewMenu.addSubview(horizonal)
        
        horizonal.bottomAnchor.constraint(equalTo: viewMenu.bottomAnchor).isActive = true
        horizonal.widthAnchor.constraint(equalTo: viewMenu.widthAnchor, multiplier: 1/3).isActive = true
        horizonal.heightAnchor.constraint(equalToConstant: 4).isActive = true
        hori = horizonal.leftAnchor.constraint(equalTo: self.viewMenu.leftAnchor, constant: 10)
      
        hori?.isActive = true
    }
//    func scrollMenuItemIndex(menuIndex: Int){
//        let indexPath = NSIndexPath(item: menuIndex, section: 0)
//        playCollection.scrollToItem(at: indexPath as IndexPath, at: [], animated: true)
//    }
    @IBAction func clickList(_ sender: UIButton) {
        let x = CGFloat(sender.tag) * viewMenu.frame.width / 3 + 10
        hori?.constant = x
//        scrollMenuItemIndex(menuIndex: sender.tag)
        UIView.animate(withDuration: 0.4, animations: {
            self.viewMenu.layoutIfNeeded()
        })
//        switch sender.tag{
//            case 0:
//                defaultbtn()
//            case 1:
//                lbBass.textColor = hexStringToUIColor(hex: "67AC47")
//                lbEqualizer.textColor = .white
//                lbExtra.textColor = .white
//            case 2:
//                lbExtra.textColor = hexStringToUIColor(hex: "67AC47")
//                lbBass.textColor = .white
//                lbEqualizer.textColor = .white
//            default: break
//        }

    }

}
