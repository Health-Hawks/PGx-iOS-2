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
    
    var selectedGene = ""
    var selectedDrug = ""
    var selectedAllele1 = ""
    var selectedAllele2 = ""
    
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
        print(selectedDrug)
        print(selectedGene)
        
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
            selectedAllele1 = allele1[row]
            Allele1Picker.isHidden = true
        }
        else if (pickerView == Allele2Picker){
            Allele2PickerBtn.setTitle(allele2[row], for: UIControlState.normal)
            selectedAllele2 = allele2[row]
            Allele2Picker.isHidden = true
        }
        else{
            print("error")
        }
    }
    
    //logic for iff statement to determine metabolizer pages
    
    @IBAction func NextBtnPressed(_ sender: Any) {
        if (selectedDrug == "Mercaptopurine" && selectedAllele1 == "*1" && selectedAllele2 == "*1"){
            performSegue(withIdentifier: "S1", sender: nil)
        }
        else if (selectedDrug == "Mercaptopurine" && selectedAllele1 == "*1" && selectedAllele2 == "*1S"){
            performSegue(withIdentifier: "S1", sender: nil)
        }
        else if (selectedDrug == "Mercaptopurine" && selectedAllele1 == "*1S" && selectedAllele2 == "*1S"){
            performSegue(withIdentifier: "S1", sender: nil)
        }
        else if (selectedDrug == "6MP" && selectedAllele1 == "*1" && selectedAllele2 == "*1"){
            performSegue(withIdentifier: "S1", sender: nil)
        }
        else if (selectedDrug == "6MP" && selectedAllele1 == "*1" && selectedAllele2 == "*1S"){
            performSegue(withIdentifier: "S1", sender: nil)
        }
        else if (selectedDrug == "6MP" && selectedAllele1 == "*1S" && selectedAllele2 == "*1S"){
            performSegue(withIdentifier: "S1", sender: nil)
        }
        else if (selectedDrug == "Purinethol" && selectedAllele1 == "*1" && selectedAllele2 == "*1"){
            performSegue(withIdentifier: "S1", sender: nil)
        }
        else if (selectedDrug == "Purinethol" && selectedAllele1 == "*1" && selectedAllele2 == "*1S"){
            performSegue(withIdentifier: "S1", sender: nil)
        }
        else if (selectedDrug == "Purinethol" && selectedAllele1 == "*1S" && selectedAllele2 == "*1S"){
            performSegue(withIdentifier: "S1", sender: nil)
        }
        else if (selectedDrug == "Purixan" && selectedAllele1 == "*1" && selectedAllele2 == "*1"){
            performSegue(withIdentifier: "S1", sender: nil)
        }
        else if (selectedDrug == "Purixan" && selectedAllele1 == "*1" && selectedAllele2 == "*1S"){
            performSegue(withIdentifier: "S1", sender: nil)
        }
        else if (selectedDrug == "Purixan" && selectedAllele1 == "*1S" && selectedAllele2 == "*1S"){
            performSegue(withIdentifier: "S1", sender: nil)
        }
        else if (selectedDrug == "6Mercaptopurine" && selectedAllele1 == "*1" && selectedAllele2 == "*1"){
            performSegue(withIdentifier: "S1", sender: nil)
        }
        else if (selectedDrug == "6Mercaptopurine" && selectedAllele1 == "*1" && selectedAllele2 == "*1S"){
            performSegue(withIdentifier: "S1", sender: nil)
        }
        else if (selectedDrug == "6Mercaptopurine" && selectedAllele1 == "*1S" && selectedAllele2 == "*1S"){
            performSegue(withIdentifier: "S1", sender: nil)
        }
        else if (selectedDrug == "Mercaptopurine" && selectedAllele1 == "*1" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "Mercaptopurine" && selectedAllele1 == "*1" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "Mercaptopurine" && selectedAllele1 == "*1" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "Mercaptopurine" && selectedAllele1 == "*1" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "Mercaptopurine" && selectedAllele1 == "*1" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "Mercaptopurine" && selectedAllele1 == "*1S" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "Mercaptopurine" && selectedAllele1 == "*1S" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "Mercaptopurine" && selectedAllele1 == "*1S" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "Mercaptopurine" && selectedAllele1 == "*1S" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "Mercaptopurine" && selectedAllele1 == "*1S" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "6MP" && selectedAllele1 == "*1" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "6MP" && selectedAllele1 == "*1" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "6MP" && selectedAllele1 == "*1" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "6MP" && selectedAllele1 == "*1" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "6MP" && selectedAllele1 == "*1" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "6MP" && selectedAllele1 == "*1S" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "6MP" && selectedAllele1 == "*1S" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "6MP" && selectedAllele1 == "*1S" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "6MP" && selectedAllele1 == "*1S" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "6MP" && selectedAllele1 == "*1S" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "Purinethol" && selectedAllele1 == "*1" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "Purinethol" && selectedAllele1 == "*1" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "Purinethol" && selectedAllele1 == "*1" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "Purinethol" && selectedAllele1 == "*1" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "Purinethol" && selectedAllele1 == "*1" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "Purinethol" && selectedAllele1 == "*1S" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "Purinethol" && selectedAllele1 == "*1S" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "Purinethol" && selectedAllele1 == "*1S" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "Purinethol" && selectedAllele1 == "*1S" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "Purinethol" && selectedAllele1 == "*1S" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "Purixan" && selectedAllele1 == "*1" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "Purixan" && selectedAllele1 == "*1" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "Purixan" && selectedAllele1 == "*1" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "Purixan" && selectedAllele1 == "*1" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "Purixan" && selectedAllele1 == "*1" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "Purixan" && selectedAllele1 == "*1S" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "Purixan" && selectedAllele1 == "*1S" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "Purixan" && selectedAllele1 == "*1S" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "Purixan" && selectedAllele1 == "*1S" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "Purixan" && selectedAllele1 == "*1S" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "6Mercaptopurine" && selectedAllele1 == "*1" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "6Mercaptopurine" && selectedAllele1 == "*1" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "6Mercaptopurine" && selectedAllele1 == "*1" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "6Mercaptopurine" && selectedAllele1 == "*1" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "6Mercaptopurine" && selectedAllele1 == "*1" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "6Mercaptopurine" && selectedAllele1 == "*1S" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "6Mercaptopurine" && selectedAllele1 == "*1S" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "6Mercaptopurine" && selectedAllele1 == "*1S" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "6Mercaptopurine" && selectedAllele1 == "*1S" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "6Mercaptopurine" && selectedAllele1 == "*1S" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S2", sender: nil)
        }
        else if (selectedDrug == "Mercaptopurine" && selectedAllele1 == "*2" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S3", sender: nil)
        }
        else if (selectedDrug == "Mercaptopurine" && selectedAllele1 == "*2" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S3", sender: nil)
        }
        else if (selectedDrug == "Mercaptopurine" && selectedAllele1 == "*2" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S3", sender: nil)
        }
        else if (selectedDrug == "Mercaptopurine" && selectedAllele1 == "*2" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S3", sender: nil)
        }
        else if (selectedDrug == "Mercaptopurine" && selectedAllele1 == "*2" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S3", sender: nil)
        }
        else if (selectedDrug == "6MP" && selectedAllele1 == "*2" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S3", sender: nil)
        }
        else if (selectedDrug == "6MP" && selectedAllele1 == "*2" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S3", sender: nil)
        }
        else if (selectedDrug == "6MP" && selectedAllele1 == "*2" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S3", sender: nil)
        }
        else if (selectedDrug == "6MP" && selectedAllele1 == "*2" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S3", sender: nil)
        }
        else if (selectedDrug == "6MP" && selectedAllele1 == "*2" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S3", sender: nil)
        }
        else if (selectedDrug == "Purinethol" && selectedAllele1 == "*2" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S3", sender: nil)
        }
        else if (selectedDrug == "Purinethol" && selectedAllele1 == "*2" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S3", sender: nil)
        }
        else if (selectedDrug == "Purinethol" && selectedAllele1 == "*2" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S3", sender: nil)
        }
        else if (selectedDrug == "Purinethol" && selectedAllele1 == "*2" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S3", sender: nil)
        }
        else if (selectedDrug == "Purinethol" && selectedAllele1 == "*2" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S3", sender: nil)
        }
        else if (selectedDrug == "Purixan" && selectedAllele1 == "*2" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S3", sender: nil)
        }
        else if (selectedDrug == "Purixan" && selectedAllele1 == "*2" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S3", sender: nil)
        }
        else if (selectedDrug == "Purixan" && selectedAllele1 == "*2" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S3", sender: nil)
        }
        else if (selectedDrug == "Purixan" && selectedAllele1 == "*2" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S3", sender: nil)
        }
        else if (selectedDrug == "Purixan" && selectedAllele1 == "*2" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S3", sender: nil)
        }
        else if (selectedDrug == "6Mercaptopurine" && selectedAllele1 == "*2" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S3", sender: nil)
        }
        else if (selectedDrug == "6Mercaptopurine" && selectedAllele1 == "*2" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S3", sender: nil)
        }
        else if (selectedDrug == "6Mercaptopurine" && selectedAllele1 == "*2" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S3", sender: nil)
        }
        else if (selectedDrug == "6Mercaptopurine" && selectedAllele1 == "*2" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S3", sender: nil)
        }
        else if (selectedDrug == "6Mercaptopurine" && selectedAllele1 == "*2" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S3", sender: nil)
        }
        else if (selectedDrug == "Thioguanine" && selectedAllele1 == "*1" && selectedAllele2 == "*1"){
            performSegue(withIdentifier: "S4", sender: nil)
        }
        else if (selectedDrug == "Thioguanine" && selectedAllele1 == "*1" && selectedAllele2 == "*1S"){
            performSegue(withIdentifier: "S4", sender: nil)
        }
        else if (selectedDrug == "Thioguanine" && selectedAllele1 == "*1S" && selectedAllele2 == "*1S"){
            performSegue(withIdentifier: "S4", sender: nil)
        }
        else if (selectedDrug == "6TG" && selectedAllele1 == "*1" && selectedAllele2 == "*1"){
            performSegue(withIdentifier: "S4", sender: nil)
        }
        else if (selectedDrug == "6TG" && selectedAllele1 == "*1" && selectedAllele2 == "*1S"){
            performSegue(withIdentifier: "S4", sender: nil)
        }
        else if (selectedDrug == "6TG" && selectedAllele1 == "*1S" && selectedAllele2 == "*1S"){
            performSegue(withIdentifier: "S4", sender: nil)
        }
        else if (selectedDrug == "6Thioguanine" && selectedAllele1 == "*1" && selectedAllele2 == "*1"){
            performSegue(withIdentifier: "S4", sender: nil)
        }
        else if (selectedDrug == "6Thioguanine" && selectedAllele1 == "*1" && selectedAllele2 == "*1S"){
            performSegue(withIdentifier: "S4", sender: nil)
        }
        else if (selectedDrug == "6Thioguanine" && selectedAllele1 == "*1S" && selectedAllele2 == "*1S"){
            performSegue(withIdentifier: "S4", sender: nil)
        }
        else if (selectedDrug == "Tabloid" && selectedAllele1 == "*1" && selectedAllele2 == "*1"){
            performSegue(withIdentifier: "S4", sender: nil)
        }
        else if (selectedDrug == "Tabloid" && selectedAllele1 == "*1" && selectedAllele2 == "*1S"){
            performSegue(withIdentifier: "S4", sender: nil)
        }
        else if (selectedDrug == "Tabloid" && selectedAllele1 == "*1S" && selectedAllele2 == "*1S"){
            performSegue(withIdentifier: "S4", sender: nil)
        }
        else if (selectedDrug == "Thioguanine" && selectedAllele1 == "*1" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "Thioguanine" && selectedAllele1 == "*1" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "Thioguanine" && selectedAllele1 == "*1" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "Thioguanine" && selectedAllele1 == "*1" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "Thioguanine" && selectedAllele1 == "*1" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "Thioguanine" && selectedAllele1 == "*1S" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "Thioguanine" && selectedAllele1 == "*1S" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "Thioguanine" && selectedAllele1 == "*1S" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "Thioguanine" && selectedAllele1 == "*1S" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "Thioguanine" && selectedAllele1 == "*1S" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "6TG" && selectedAllele1 == "*1" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "6TG" && selectedAllele1 == "*1" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "6TG" && selectedAllele1 == "*1" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "6TG" && selectedAllele1 == "*1" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "6TG" && selectedAllele1 == "*1" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "6TG" && selectedAllele1 == "*1S" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "6TG" && selectedAllele1 == "*1S" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "6TG" && selectedAllele1 == "*1S" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "6TG" && selectedAllele1 == "*1S" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "6TG" && selectedAllele1 == "*1S" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "6Thioguanine" && selectedAllele1 == "*1" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "6Thioguanine" && selectedAllele1 == "*1" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "6Thioguanine" && selectedAllele1 == "*1" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "6Thioguanine" && selectedAllele1 == "*1" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "6Thioguanine" && selectedAllele1 == "*1" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "6Thioguanine" && selectedAllele1 == "*1S" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "6Thioguanine" && selectedAllele1 == "*1S" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "6Thioguanine" && selectedAllele1 == "*1S" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "6Thioguanine" && selectedAllele1 == "*1S" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "6Thioguanine" && selectedAllele1 == "*1S" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "Tabloid" && selectedAllele1 == "*1" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "Tabloid" && selectedAllele1 == "*1" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "Tabloid" && selectedAllele1 == "*1" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "Tabloid" && selectedAllele1 == "*1" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "Tabloid" && selectedAllele1 == "*1" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "Tabloid" && selectedAllele1 == "*1S" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "Tabloid" && selectedAllele1 == "*1S" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "Tabloid" && selectedAllele1 == "*1S" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "Tabloid" && selectedAllele1 == "*1S" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "Tabloid" && selectedAllele1 == "*1S" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S5", sender: nil)
        }
        else if (selectedDrug == "Thioguanine" && selectedAllele1 == "*2" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S6", sender: nil)
        }
        else if (selectedDrug == "Thioguanine" && selectedAllele1 == "*2" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S6", sender: nil)
        }
        else if (selectedDrug == "Thioguanine" && selectedAllele1 == "*2" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S6", sender: nil)
        }
        else if (selectedDrug == "Thioguanine" && selectedAllele1 == "*2" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S6", sender: nil)
        }
        else if (selectedDrug == "Thioguanine" && selectedAllele1 == "*2" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S6", sender: nil)
        }
        else if (selectedDrug == "6TG" && selectedAllele1 == "*2" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S6", sender: nil)
        }
        else if (selectedDrug == "6TG" && selectedAllele1 == "*2" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S6", sender: nil)
        }
        else if (selectedDrug == "6TG" && selectedAllele1 == "*2" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S6", sender: nil)
        }
        else if (selectedDrug == "6TG" && selectedAllele1 == "*2" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S6", sender: nil)
        }
        else if (selectedDrug == "6TG" && selectedAllele1 == "*2" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S6", sender: nil)
        }
        else if (selectedDrug == "6Thioguanine" && selectedAllele1 == "*2" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S6", sender: nil)
        }
        else if (selectedDrug == "6Thioguanine" && selectedAllele1 == "*2" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S6", sender: nil)
        }
        else if (selectedDrug == "6Thioguanine" && selectedAllele1 == "*2" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S6", sender: nil)
        }
        else if (selectedDrug == "6Thioguanine" && selectedAllele1 == "*2" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S6", sender: nil)
        }
        else if (selectedDrug == "6Thioguanine" && selectedAllele1 == "*2" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S6", sender: nil)
        }
        else if (selectedDrug == "Tabloid" && selectedAllele1 == "*2" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S6", sender: nil)
        }
        else if (selectedDrug == "Tabloid" && selectedAllele1 == "*2" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S6", sender: nil)
        }
        else if (selectedDrug == "Tabloid" && selectedAllele1 == "*2" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S6", sender: nil)
        }
        else if (selectedDrug == "Tabloid" && selectedAllele1 == "*2" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S6", sender: nil)
        }
        else if (selectedDrug == "Tabloid" && selectedAllele1 == "*2" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S6", sender: nil)
        }
        if (selectedDrug == "Azathioprine" && selectedAllele1 == "*1" && selectedAllele2 == "*1"){
            performSegue(withIdentifier: "S7", sender: nil)
        }
        else if (selectedDrug == "Azathioprine" && selectedAllele1 == "*1" && selectedAllele2 == "*1S"){
            performSegue(withIdentifier: "S7", sender: nil)
        }
        else if (selectedDrug == "Azathioprine" && selectedAllele1 == "*1S" && selectedAllele2 == "*1S"){
            performSegue(withIdentifier: "S7", sender: nil)
        }
        if (selectedDrug == "Azasan" && selectedAllele1 == "*1" && selectedAllele2 == "*1"){
            performSegue(withIdentifier: "S7", sender: nil)
        }
        else if (selectedDrug == "Azasan" && selectedAllele1 == "*1" && selectedAllele2 == "*1S"){
            performSegue(withIdentifier: "S7", sender: nil)
        }
        else if (selectedDrug == "Azasan" && selectedAllele1 == "*1S" && selectedAllele2 == "*1S"){
            performSegue(withIdentifier: "S7", sender: nil)
        }
        if (selectedDrug == "Imuran" && selectedAllele1 == "*1" && selectedAllele2 == "*1"){
            performSegue(withIdentifier: "S7", sender: nil)
        }
        else if (selectedDrug == "Imuran" && selectedAllele1 == "*1" && selectedAllele2 == "*1S"){
            performSegue(withIdentifier: "S7", sender: nil)
        }
        else if (selectedDrug == "Imuran" && selectedAllele1 == "*1S" && selectedAllele2 == "*1S"){
            performSegue(withIdentifier: "S7", sender: nil)
        }
        else if (selectedDrug == "Azathioprine" && selectedAllele1 == "*1" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S8", sender: nil)
        }
        else if (selectedDrug == "Azathioprine" && selectedAllele1 == "*1" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S8", sender: nil)
        }
        else if (selectedDrug == "Azathioprine" && selectedAllele1 == "*1" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S8", sender: nil)
        }
        else if (selectedDrug == "Azathioprine" && selectedAllele1 == "*1" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S8", sender: nil)
        }
        else if (selectedDrug == "Azathioprine" && selectedAllele1 == "*1" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S8", sender: nil)
        }
        else if (selectedDrug == "Azathioprine" && selectedAllele1 == "*1S" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S8", sender: nil)
        }
        else if (selectedDrug == "Azathioprine" && selectedAllele1 == "*1S" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S8", sender: nil)
        }
        else if (selectedDrug == "Azathioprine" && selectedAllele1 == "*1S" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S8", sender: nil)
        }
        else if (selectedDrug == "Azathioprine" && selectedAllele1 == "*1S" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S8", sender: nil)
        }
        else if (selectedDrug == "Azathioprine" && selectedAllele1 == "*1S" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S8", sender: nil)
        }
        else if (selectedDrug == "Azasan" && selectedAllele1 == "*1" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S8", sender: nil)
        }
        else if (selectedDrug == "Azasan" && selectedAllele1 == "*1" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S8", sender: nil)
        }
        else if (selectedDrug == "Azasan" && selectedAllele1 == "*1" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S8", sender: nil)
        }
        else if (selectedDrug == "Azasan" && selectedAllele1 == "*1" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S8", sender: nil)
        }
        else if (selectedDrug == "Azasan" && selectedAllele1 == "*1" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S8", sender: nil)
        }
        else if (selectedDrug == "Azasan" && selectedAllele1 == "*1S" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S8", sender: nil)
        }
        else if (selectedDrug == "Azasan" && selectedAllele1 == "*1S" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S8", sender: nil)
        }
        else if (selectedDrug == "Azasan" && selectedAllele1 == "*1S" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S8", sender: nil)
        }
        else if (selectedDrug == "Azasan" && selectedAllele1 == "*1S" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S8", sender: nil)
        }
        else if (selectedDrug == "Azasan" && selectedAllele1 == "*1S" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S8", sender: nil)
        }
        else if (selectedDrug == "Imuran" && selectedAllele1 == "*1" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S8", sender: nil)
        }
        else if (selectedDrug == "Imuran" && selectedAllele1 == "*1" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S8", sender: nil)
        }
        else if (selectedDrug == "Imuran" && selectedAllele1 == "*1" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S8", sender: nil)
        }
        else if (selectedDrug == "Imuran" && selectedAllele1 == "*1" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S8", sender: nil)
        }
        else if (selectedDrug == "Imuran" && selectedAllele1 == "*1" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S8", sender: nil)
        }
        else if (selectedDrug == "Imuran" && selectedAllele1 == "*1S" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S8", sender: nil)
        }
        else if (selectedDrug == "Imuran" && selectedAllele1 == "*1S" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S8", sender: nil)
        }
        else if (selectedDrug == "Imuran" && selectedAllele1 == "*1S" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S8", sender: nil)
        }
        else if (selectedDrug == "Imuran" && selectedAllele1 == "*1S" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S8", sender: nil)
        }
        else if (selectedDrug == "Imuran" && selectedAllele1 == "*1S" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S8", sender: nil)
        }
        else if (selectedDrug == "Azathioprine" && selectedAllele1 == "*2" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S9", sender: nil)
        }
        else if (selectedDrug == "Azathioprine" && selectedAllele1 == "*2" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S9", sender: nil)
        }
        else if (selectedDrug == "Azathioprine" && selectedAllele1 == "*2" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S9", sender: nil)
        }
        else if (selectedDrug == "Azathioprine" && selectedAllele1 == "*2" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S9", sender: nil)
        }
        else if (selectedDrug == "Azathioprine" && selectedAllele1 == "*2" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S9", sender: nil)
        }
        else if (selectedDrug == "Azasan" && selectedAllele1 == "*2" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S9", sender: nil)
        }
        else if (selectedDrug == "Azasan" && selectedAllele1 == "*2" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S9", sender: nil)
        }
        else if (selectedDrug == "Azasan" && selectedAllele1 == "*2" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S9", sender: nil)
        }
        else if (selectedDrug == "Azasan" && selectedAllele1 == "*2" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S9", sender: nil)
        }
        else if (selectedDrug == "Azasan" && selectedAllele1 == "*2" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S9", sender: nil)
        }
        else if (selectedDrug == "Imuran" && selectedAllele1 == "*2" && selectedAllele2 == "*2"){
            performSegue(withIdentifier: "S9", sender: nil)
        }
        else if (selectedDrug == "Imuran" && selectedAllele1 == "*2" && selectedAllele2 == "*3A"){
            performSegue(withIdentifier: "S9", sender: nil)
        }
        else if (selectedDrug == "Imuran" && selectedAllele1 == "*2" && selectedAllele2 == "*3B"){
            performSegue(withIdentifier: "S9", sender: nil)
        }
        else if (selectedDrug == "Imuran" && selectedAllele1 == "*2" && selectedAllele2 == "*3C"){
            performSegue(withIdentifier: "S9", sender: nil)
        }
        else if (selectedDrug == "Imuran" && selectedAllele1 == "*2" && selectedAllele2 == "*4"){
            performSegue(withIdentifier: "S9", sender: nil)
        }
        else{
            print ("error")
        }
        
        
    }
    
}


        
        
        
        

