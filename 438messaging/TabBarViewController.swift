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
    var access = TabBarViewController.self
    //var groupsTab:GroupsTableViewController

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.title = username
        // Do any additional setup after loading the view.
        //print(tabBarController?.viewControllers)
        //var groupsTab = self.tabBarController?.viewControllers![1] as! GroupsTableViewController
        GlobalVariables.globalUsername = username
        //groupsTab.username = username
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func unwindToTab(segue:UIStoryboardSegue) { }
    
    //cant prepare because not a segue
//    override func prepare(for relationship: UIStoryboardSegue, sender: Any?) {
//        if relationship.identifier == "login" {
//            let vc = segue.destination as? GroupsTableViewController
//
//            vc?.username = userName.text!
//
//        }
//    }

   

}
