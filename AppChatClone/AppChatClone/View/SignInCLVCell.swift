//
//  SignInCLVCell.swift
//  AppChatClone
//
//  Created by NgocHap on 06/04/2022.
//

import UIKit

class SignInCLVCell: UICollectionViewCell {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnSignIn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let bottomLine = CALayer()
        btnSignIn.layer.cornerRadius = btnSignIn.frame.height / 2
        
        bottomLine.frame = CGRect(x: 0.0, y: txtEmail.frame.height + 5, width: txtEmail.frame.width, height: 1.0)
        bottomLine.backgroundColor = hexStringToUIColor(hex: "#D2D2D2").cgColor
        txtEmail.borderStyle = UITextField.BorderStyle.none
        txtEmail.layer.addSublayer(bottomLine)
        
        let bottomLine1 = CALayer()
        bottomLine1.frame = CGRect(x: 0.0, y: txtPassword.frame.height + 6, width: txtPassword.frame.width, height: 1.0)
        bottomLine1.backgroundColor = hexStringToUIColor(hex: "#D2D2D2").cgColor
        txtPassword.borderStyle = UITextField.BorderStyle.none
        txtPassword.layer.addSublayer(bottomLine1)
        
        txtEmail.addTarget(self, action: #selector(txtChange(_:)), for: .editingChanged)
        txtPassword.addTarget(self, action: #selector(txtChange(_:)), for: .editingChanged)
    }
    @objc func txtChange(_ textField: UITextField) {
        if txtEmail.text == "" || txtPassword.text == "" {
            btnSignIn.backgroundColor = hexStringToUIColor(hex: "CACACA")
        } else {
            btnSignIn.backgroundColor = hexStringToUIColor(hex: "5B71E2")
        }
    }
    @IBAction func btnSingIn(_ sender: Any) {
       let parent = parentVC as? SignInController
        let vc = parent?.storyboard?.instantiateViewController(withIdentifier: "tabBarController") as? tabBarController
        print("sss")
        parent?.navigationController?.pushViewController(vc!, animated: true)
       
        
    }
}
