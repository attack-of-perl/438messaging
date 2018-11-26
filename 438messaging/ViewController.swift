//
//  ViewController.swift
//  438messaging
//
//  Created by Zachary Perlman on 11/9/18.
//  Copyright © 2018 Zachary Perlman. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var textField: UITextField!
    
    var ref: DatabaseReference!
    var databaseHandle: DatabaseHandle?
    
    var postData = [String]()
    var time:Int = 0
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1 // This was put in mainly for my own unit testing
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count // Most of the time my data source is an array of something...  will replace with the actual name of the data source
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Note:  Be sure to replace the argument to dequeueReusableCellWithIdentifier with the actual identifier string!
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell")
        
        // set cell's textLabel.text property
        cell?.textLabel?.text = postData[indexPath.row]
        // set cell's detailTextLabel.text property
        
        return cell!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        
        //set firebase database reference
        ref = Database.database().reference()
        
        //pull posts and listen for change
        databaseHandle =  ref?.child("Posts").observe(.childAdded, with: {(snapshot) in
            //code when new child added
            //convert to string if possible
           // let childSnap = snapshot.childSnapshot(forPath: "text")  //for more advanced data structure
            let post = snapshot.value as? String
            
            if let actualPost = post{
                //appends data to array
                self.postData.append(actualPost)
                //reload tableview
                self.tableView.reloadData()
            }
        })
    }
    @IBAction func sendButton(_ sender: Any) {
        
        //        time = time+1
        //        self.ref.child("groups/\testGroup/").child("testGroup").setValue([String(time): "hi"])
        let testPost = textField.text
//        let newPost = [
//            "text":  textField.text!,
//          //  "timestamp": String(Int(NSDate().timeIntervalSince1970)),
//            ] as [String : Any]
//
//                let newPost = [
//                    "10":  false,
//                    "11": true,
//                    "12": false
//                    ] as [String : Any]
//
       // ref?.child("Posts").childByAutoId().setValue(newPost)     //advanced
        ref?.child("Posts").childByAutoId().setValue(testPost)       //test
        textField.text = ""
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

