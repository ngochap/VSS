//
//  SignUpCLVCell.swift
//  AppChatClone
//
//  Created by NgocHap on 06/04/2022.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class SignUpCLVCell: UICollectionViewCell {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var checkBox: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var nameError: UILabel!
    @IBOutlet weak var confirmPassError: UILabel!
    @IBOutlet weak var passError: UILabel!
    
    var check: Bool = true
   
    override func awakeFromNib() {
        super.awakeFromNib()
        btnSignUp.layer.cornerRadius = btnSignUp.frame.height / 2
        btnSignUp.backgroundColor = hexStringToUIColor(hex: "5B71E2")
        txtEmail.addTarget(self, action: #selector(txtChange(_:)), for: .editingChanged)
        txtName.addTarget(self, action: #selector(ChangeName), for: .editingChanged)
        txtPassword.addTarget(self, action: #selector(ChangePass), for: .editingChanged)
        txtConfirmPassword.addTarget(self, action: #selector(ChangeConfirmPass), for: .editingChanged)
        defaultError()
    }
    func defaultError() {
        emailError.isHidden = true
        nameError.isHidden = true
        confirmPassError.isHidden = true
        passError.isHidden = true
    }
    
    @objc func ChangeName() -> String? {
        let nameRegEx = "(?<! )[-a-zA-Z' ]{2,26}"
        let namePred = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
         //emailPred.evaluate(with: txtEmail.text)
        if namePred.evaluate(with: txtName.text) == false {
            nameError.text = "tên phải bao gồm 2 kí tự trở lên và không có kí tự đặc biệt"
           // emailPred.evaluate(with: txtEmail.text)
            nameError.isHidden = false
        } else {
            nameError.isHidden = true
        }
        return nil
        
    }
    @objc func ChangePass() -> String? {
        let RegEx = "^(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9]{6,}$"
        let Pred = NSPredicate(format:"SELF MATCHES %@", RegEx)
        if Pred.evaluate(with: txtPassword.text) == false {
            passError.text = "mật khẩu phải gồm 6 kí tự và số"
            passError.isHidden = false
        } else {
            passError.isHidden = true
        }
       
        return nil
    }
    @objc func ChangeConfirmPass() -> String? {
        if txtConfirmPassword.text != txtPassword.text {
            confirmPassError.text = "không trùng mật khẩu"
            confirmPassError.isHidden = false
            
        } else {
            confirmPassError.isHidden = true
        }
        return nil
    }
    @objc func txtChange(_ textField: UITextField) -> String?{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
         //emailPred.evaluate(with: txtEmail.text)
        if emailPred.evaluate(with: txtEmail.text) == false {
            emailError.text = "Email phải có dạng yourName@gmail.com"
           // emailPred.evaluate(with: txtEmail.text)
        } else {
            emailError.isHidden = true
        }
        return nil
    }
    func validateFiled() -> String? {
        let parent = parentVC as? SignUpViewController
        if txtName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || txtEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || txtPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || txtConfirmPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            parent!.showToast(message: "Please fill in all fields", font: .systemFont(ofSize: 12))
            return "Please fill in all fields"
        }
        if txtPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) != txtConfirmPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) {
            parent!.showToast(message: "Passwork not match", font: .systemFont(ofSize: 12))
            return "Passwork not match"
        }
        if check == true {
            parent!.showToast(message: " vui lòng chấp nhận các chính sách và điều khoản", font: .systemFont(ofSize: 14))
            return "true"
        }
        
        return nil
    }
    @IBAction func btnChinhSach(_ sender: Any) {
        print("ssss")
    }
    @IBAction func btnDieuKhoan(_ sender: Any) {
        print("ssss")
    }
    
    @IBAction func btnSignUp(_ sender: UIButton) {
        let parent = self.parentVC as? SignUpViewController
        let error = validateFiled()
        if error != nil {
        } else {
            let name = txtName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = txtEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = txtPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            Auth.auth().createUser(withEmail: email, password: password) {
                (result, err) in
                if err != nil {
                    
                    parent?.showToast(message: "Error creating user", font: .systemFont(ofSize: 14))
                    
                } else {
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["email": email, "password": password,"name": name]) { (error) in
                        if error != nil {
                            parent?.showToast(message: "Error saving user data", font: .systemFont(ofSize: 14))
                        }
                    }
                    backToLogin()
                }
            }
        }
        
        func backToLogin() {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let vc = storyboard.instantiateViewController(withIdentifier: "SignInController") as? SignInController else {
                return
            }
            let parent = self.parentVC as? SignUpViewController
            vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
            parent?.present(vc, animated: true, completion: nil)
            
        }
        
    }
    @IBAction func Box(_ sender: UIButton) {
        if check {
            checkBox.setImage(UIImage(named: "check"), for: .normal)
        } else {
            checkBox.setImage(UIImage(named: "checklist"), for: .normal)
        }
        check = !check
    }
}
