//
//  ViewController.swift
//  eventView
//
//  Created by Pranav Buggana on 11/29/18.
//  Copyright © 2018 Pranav Buggana. All rights reserved.
//

import UIKit

class PranavViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBAction func unwindToPranav(segue:UIStoryboardSegue) { }
    var masterAvail:[[Int]] = [[0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0],[0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0],[0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0]]
    
    var hours:[String] = ["8:00am",    "9:00am",    "10:00am",    "11:00am",    "12:00pm",    "1:00pm",    "2:00pm",    "3:00pm",    "4:00pm",    "5:00pm",    "6:00pm",    "7:00pm",    "8:00pm",    "9:00pm",    "10:00pm",    "11:00pm",    "12:00am"]
    
    var colors:[UIColor] = [UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray]
    
    var available:[Int] = []
    
    
    var dates:[String] = ["12/22","12/23","12/24"]
    
    var theDate:String = "12/22"
    
    var idx:Int = 0
    
    func setParams(){
        
        idx = dates.index(of: theDate)!
        available = masterAvail[idx]
        
        for i in 0..<colors.count{
            if available[i] == 0{
                colors[i] = UIColor.lightGray
            }else{
                colors[i] = UIColor.blue
            }
        }
        dateLabel.text! = theDate
    }
    
    
    
    @IBAction func saveView(_ sender: Any) {
          masterAvail[idx] = available
    }
    
  
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var theCollectionView: UICollectionView!
    
    @IBAction func unwindFromPicker(_ sender: UIStoryboardSegue){
        
        if sender.source is pickerView{
            if let senderVC = sender.source as? pickerView{
                theDate = senderVC.selection
            }
            setParams()
            theCollectionView.reloadData()
        }
        
    }
    
    @IBAction func resetView(_ sender: Any) {
        
        colors = [UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray]
        
        available = [0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0]
        
        masterAvail[idx] = available

        
        theCollectionView.reloadData()
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return hours.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = theCollectionView.dequeueReusableCell(withReuseIdentifier: "timeCell", for: indexPath) as! timeCell
        
        
        
            
            
            cell.theLabel.text! = hours[indexPath.section]
            
            cell.backgroundColor = colors[indexPath.section]
            
        
        
        cell.layer.cornerRadius = 4.0
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.clear.cgColor

        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let cell = theCollectionView.cellForItem(at: indexPath) as! timeCell

        let idx = hours.index(of: cell.theLabel.text!)!

        if colors[idx] == UIColor.lightGray{
            colors[idx] = UIColor.blue
            available[idx] = 1
        }else{
            colors[idx] = UIColor.lightGray
            available[idx] = 0
        }
        
        theCollectionView.reloadData()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setParams()
        
        theCollectionView.dataSource = self
        theCollectionView.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "pickerSegue") {
            
            let dest = segue.destination as! pickerView
            
            dest.pickerData = dates
            dest.selection = dates[0]
        }
    }

}

