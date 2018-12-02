//
//  masterView.swift
//  eventView
//
//  Created by Pranav Buggana on 11/30/18.
//  Copyright © 2018 Pranav Buggana. All rights reserved.
//

import UIKit

class masterView: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    
    
    func makeColors(){
        
        for i in 0..<hours.count{
            
            if available[i] == ""{
                colors.append(UIColor.green)
            }else{
                colors.append(UIColor.lightGray)
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return hours.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = theCollectionView.dequeueReusableCell(withReuseIdentifier: "masterCell", for: indexPath) as! masterCell
        
        for item in indexPath{
            
            cell.theLabel.text! = hours[indexPath.section]
            
        let theNames = available[indexPath.section].components(separatedBy: ",")
        var text = cell.theConflicts.text!
            
        if theNames.count==1 && theNames[0] == ""{
            
            text = "\(0)" + String(text.dropFirst())
            
            }else{
                text = "\(theNames.count)" + String(text.dropFirst())
            }
        cell.theConflicts.text! = text
            
            cell.theLabel.backgroundColor = colors[indexPath.section]
            
        }
        

        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
         let theNames = available[indexPath.section].components(separatedBy: ",")
        
        let newVC = storyboard?.instantiateViewController(withIdentifier: "conflictsList") as! conflictsList
        
        newVC.thePeeps = theNames
        self.present(newVC, animated:true, completion:nil)

    }

    @IBOutlet weak var theCollectionView: UICollectionView!
    
    
    var  available:[String] = ["Donald, Fred, Eric", "",    "Barack, Romney",    "",    "",    "Clinton",    "Marco,Beto",   "Donald",    "Mitt",    "",    "",    "",    "",   "Claire",    "",    "",    "Abrams,Gillum"]
    
    var hours:[String] = ["8:00am",    "9:00am",    "10:00am",    "11:00am",    "12:00pm",    "1:00pm",    "2:00pm",    "3:00pm",    "4:00pm",    "5:00pm",    "6:00pm",    "7:00pm",    "8:00pm",    "9:00pm",    "10:00pm",    "11:00pm",    "12:00am"]
    
    var colors:[UIColor] = []


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeColors()
        
        theCollectionView.delegate = self
        theCollectionView.dataSource = self
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
