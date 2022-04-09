//
//  SignInController.swift
//  AppChatClone
//
//  Created by NgocHap on 06/04/2022.
//

import UIKit

class SignInController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
   
    
    @IBOutlet weak var signInCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInCollectionView.dataSource = self
        signInCollectionView.delegate = self
        signInCollectionView.register(UINib(nibName: "SignInCLVCell", bundle: nil), forCellWithReuseIdentifier: "SignInCLVCell")
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.signInCollectionView.collectionViewLayout.invalidateLayout()

    }
    
    @IBAction func btnSignUp(_ sender: Any) {
        let vc = (storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController)
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        present(vc, animated: true, completion: nil)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SignInCLVCell", for: indexPath) as? SignInCLVCell else {return UICollectionViewCell()}
        return cell
    }
    
}
extension SignInController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: signInCollectionView.bounds.width, height: signInCollectionView.bounds.width)
    }
}
