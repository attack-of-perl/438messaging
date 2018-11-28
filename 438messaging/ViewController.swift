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
    
    var postData = [Message]()
    
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
        let message = postData[indexPath.row]
        // set cell's textLabel.text property
        cell?.textLabel?.text = message.text
        // set cell's detailTextLabel.text property
        cell?.detailTextLabel?.text = message.name      //not showing up currently

        return cell!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        
        //set firebase database reference
        ref = Database.database().reference().child("Posts")
        
        //pull posts and listen for change
        //databaseHandle =  ref?.child("Posts").observe(.childAdded, with: {(snapshot) in
        ref.observe(.childAdded, with: { (snapshot) in
            
        
            if let dictionary = snapshot.value as? [String: Any] {
                 let message = Message()
                //message.setValuesForKeys(dictionary)    //this line is what breaks it
                message.text = dictionary["text"] as? String
                message.name = dictionary["name"] as? String
                message.timestamp = dictionary["timestamp"] as? NSDate
                print(message.text as Any)
                self.postData.append(message)

               DispatchQueue.main.async {
                    self.tableView.reloadData()
                }

            }
            print(snapshot)
        }, withCancel: nil)
        

            
//            if let actualPost = post{
//                //appends data to array
//                self.postData.append(actualPost)
//                //reload tableview
//                self.tableView.reloadData()
//            }
        
    }
    @IBAction func sendButton(_ sender: Any) {
        
        let newPost = [
            "text":  textField.text!,
            "name":  "Zach",
            "timestamp": String(Int(NSDate().timeIntervalSince1970)),
            ] as [String : Any]

        ref?.childByAutoId().setValue(newPost)
        
        textField.text = ""
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

