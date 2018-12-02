//
//  TabBarViewController.swift
//  438messaging
//
//  Created by Zachary Perlman on 12/1/18.
//  Copyright © 2018 Zachary Perlman. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
   
    @IBOutlet var navBar: UINavigationItem!
    
    var username:String = "Placeholder"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.title = username
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //cant prepare because not a segue
//    override func prepare(for relationship: UIStoryboardSegue, sender: Any?) {
//        if relationship.identifier == "login" {
//            let vc = segue.destination as? GroupsTableViewController
//
//            vc?.username = userName.text!
//
//        }
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
