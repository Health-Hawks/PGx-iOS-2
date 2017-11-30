//
//  Allele.swift
//  pgx_ios
//
//  Created by Tabor Scott on 11/21/17.
//  Copyright © 2017 Tabor Scott. All rights reserved.
//

import Foundation
import UIKit
class AlleleViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    @IBOutlet weak var Allele1PickerBtn: UIButton!
    @IBOutlet weak var Allele2PickerBtn: UIButton!
    @IBOutlet weak var Allele1Picker: UIPickerView!
    @IBOutlet weak var Allele2Picker: UIPickerView!
    
    let allele1 = ["*1", "1S", "*2"]
    let allele2 = ["*1", "1S", "*2", "3A", "*3B", "*3C", "*4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Allele1Picker?.dataSource = self
        Allele2Picker?.dataSource = self
        Allele1Picker?.delegate = self
        Allele2Picker?.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Allele1BtnPressed(_ sender: Any) {
        Allele1Picker.isHidden = false
        Allele2Picker.isHidden = true
    }
    
    @IBAction func Allele2BtnPressed(_ sender: Any) {
        Allele2Picker.isHidden = false
        Allele1Picker.isHidden = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == Allele1Picker) {
            return allele1.count
        }
        else{
            return allele2.count}
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == Allele1Picker){
            return allele1 [row]
        }
        else{
            return allele2 [row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == Allele1Picker){
            Allele1PickerBtn.setTitle(allele1[row], for: UIControlState.normal)
            Allele1Picker.isHidden = true
        }
        else if (pickerView == Allele2Picker){
            Allele2PickerBtn.setTitle(allele2[row], for: UIControlState.normal)
            Allele2Picker.isHidden = true
        }
        else{
            print("error")
        }
}
}
        
        
        
        

