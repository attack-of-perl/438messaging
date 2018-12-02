//
//  pickerView.swift
//  eventView
//
//  Created by Pranav Buggana on 11/30/18.
//  Copyright © 2018 Pranav Buggana. All rights reserved.
//

import UIKit

class pickerView: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    var pickerData = [String]()
    var selection:String = ""
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selection = pickerData[row]
    }
    
    @IBOutlet weak var thePicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        thePicker.delegate = self
        thePicker.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
