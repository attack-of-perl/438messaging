//
//  ViewController.swift
//  438messaging
//
//  Created by Zachary Perlman on 11/9/18.
//  Copyright © 2018 Zachary Perlman. All rights reserved.
//

import UIKit
import FirebaseDatabase

class MessageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var textField: UITextField!

    @IBOutlet var myTextField: UITextField!
    
    @IBOutlet var groupTitle: UINavigationItem!
    
    
    var ref: DatabaseReference!
    var databaseHandle: DatabaseHandle?
    
    var postData = [Message]()
    var currentName:String? = "Zach"
    var groupName:String = ""
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
        cell?.textLabel?.text = message.name
//        messageContent.text = message.text
//        messageName.text = message.name
        // set cell's detailTextLabel.text property
        cell?.detailTextLabel?.text = message.text      //not showing up currently
//        let label = UILabel.init(frame: CGRect(x:0,y:0,width:100,height:20))
//        label.text = message.text

        return cell!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        groupTitle.title = groupName
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
        myTextField.delegate = self
        //scrollBottom()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool
    {
        //set maximum length of message allowed
        let maxLength = 150
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    func scrollBottom() {
        let lastIndex = NSIndexPath(row: postData.count-1, section: 1)
        self.tableView.scrollToRow(at: lastIndex as IndexPath, at: UITableViewScrollPosition.bottom, animated: false)
    }
    
    @IBAction func sendButton(_ sender: Any) {
        
        let newPost = [
            "text":  textField.text!,
            "name":  currentName as Any,
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


//Credit for group image: <div>Icons made by <a href="https://www.freepik.com/" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/"                 title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/"                 title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>

