//
//  conflictsList.swift
//  eventView
//
//  Created by Pranav Buggana on 11/30/18.
//  Copyright © 2018 Pranav Buggana. All rights reserved.
//

import UIKit

class conflictsList: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return thePeeps.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = theTableView.dequeueReusableCell(withIdentifier: "conflictCell") as! conflictsCell
        

            cell.theLabel.text! = thePeeps[indexPath.row]
            
        
        
        return cell
    }
    

    var thePeeps = [String]()
    
    @IBOutlet weak var theTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        theTableView.dataSource = self
        theTableView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
