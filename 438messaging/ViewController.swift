//
//  ViewController.swift
//  438messaging
//
//  Created by Zachary Perlman on 11/9/18.
//  Copyright © 2018 Zachary Perlman. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    var ref: DatabaseReference!
    var databaseHandle: DatabaseHandle?
    
    var postData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //set firebase database reference
        ref = Database.database().reference()
        
        //pull posts and listen for change
        databaseHandle =  ref?.child("groups").child("testGroup").observe(.childAdded, with: {(snapshot) in
            self.postData.append("")
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

