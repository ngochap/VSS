//
//  tabBarController.swift
//  AppChatClone
//
//  Created by NgocHap on 10/04/2022.
//

import UIKit

class TabBarController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tab()
    }
    func tab() {
//            if let tabBarItem1 = self.tabBarController?.tabBar.items?[0] {
//               tabBarItem1.title = "Myanmar"
//               tabBarItem1.image = UIImage(systemName: "m.square.fill")
//               tabBarItem1.selectedImage = UIImage(systemName: "m.square")
//           }
//           if let tabBarItem2 = self.tabBarController?.tabBar.items?[1] {
//               tabBarItem2.title = "Singapore"
//               tabBarItem2.image = UIImage(systemName: "s.square.fill")
//               tabBarItem2.selectedImage = UIImage(systemName: "s.square")
//           }
           if let tabBarItem3 = self.tabBarController?.tabBar.items?[0] {
              
               tabBarItem3.image = UIImage(systemName: "banbe")
               tabBarItem3.selectedImage = UIImage(systemName: "banbe")
           }
    }
}
