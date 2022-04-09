//
//  SignUpViewController.swift
//  AppChatClone
//
//  Created by NgocHap on 06/04/2022.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var signUoCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        signUoCollection.dataSource = self
        signUoCollection.delegate = self
        signUoCollection.register(UINib(nibName: "SignUpCLVCell", bundle: nil), forCellWithReuseIdentifier: "SignUpCLVCell")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        signUoCollection.collectionViewLayout.invalidateLayout()
    }
    @IBAction func btnSignIn(_ sender: Any) {
        dismiss(animated: true)

    }
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true)
        
    }
}
extension SignUpViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SignUpCLVCell", for: indexPath) as? SignUpCLVCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    
}
extension SignUpViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
extension SignUpViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: signUoCollection.bounds.width, height: signUoCollection.bounds.width)
    }
}
