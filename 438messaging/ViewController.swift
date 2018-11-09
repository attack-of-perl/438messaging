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
    @IBOutlet var textField: UITextField!
    
    var ref: DatabaseReference!
    var databaseHandle: DatabaseHandle?
    
    var postData = [String]()
    var time:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //set firebase database reference
        ref = Database.database().reference()
        
        //pull posts and listen for change
        databaseHandle =  ref?.child("groups").child("testGroup").observe(.childAdded, with: {(snapshot) in
            self.postData.append("")
        })
        tableView.dataSource = postData as? UITableViewDataSource
        updateMessages()
    }
    @IBAction func sendButton(_ sender: Any) {
        
//        time = time+1
//        self.ref.child("groups/\testGroup/").child("testGroup").setValue([String(time): "hi"])
        
        
        let key = ref?.child("posts").childByAutoId().key
        let userID = 4
        let username = "user"
        let title = "title"
        let body = textField.text
        let post = ["uid": userID,
                    "author": username,
                    "title": title,
                    "body": body] as [String : Any]
        let childUpdates = ["/posts/\(String(describing: key))": post,
                            "/user-posts/\(userID)/\(String(describing: key))/": post]
        ref.updateChildValues(childUpdates)
    }
    
    func updateMessages() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

