//
//  ViewController.swift
//  pgx_ios
//
//  Created by Tabor Scott on 10/11/17.
//  Copyright © 2017 Tabor Scott. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {


    
    @IBOutlet weak var GenePicker: UIPickerView!
    @IBOutlet weak var GenePickerBtn: UIButton!
    
    @IBOutlet weak var DrugPicker: UIPickerView!
    @IBOutlet weak var DrugPickerBtn: UIButton!
    
    
    
    let genes = ["TPMT", "test1", "test2"]
    let drugs = ["Mercaptopurine", "6MP", "Purinethol", "Purixan", "6Mercaptopurine", "Thioguanine", "6TG", "6Thioguanine", "Tabloid", "Azathioprine", "Azasan", "Imuran"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        GenePicker?.dataSource = self
        GenePicker?.delegate = self
        DrugPicker?.dataSource = self
        DrugPicker?.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func GenePickerBtnPressed(_ sender: AnyObject) {
        GenePicker.isHidden = false;
    }
    

    @IBAction func DrugPickerBtnPressed(_ sender: Any) {
        DrugPicker.isHidden = false;
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == GenePicker) {
            return genes.count
        }
        else{
            return drugs.count}
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == GenePicker){
            return genes [row]
        }
        else{
            return drugs [row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == GenePicker){
            GenePickerBtn.setTitle(genes[row], for: UIControlState.normal)
            GenePicker.isHidden = true
        }
        else if (pickerView == DrugPicker){
            DrugPickerBtn.setTitle(drugs[row], for: UIControlState.normal)
            DrugPicker.isHidden = true
        }
        else{
            print("error")
        }
    }
}

