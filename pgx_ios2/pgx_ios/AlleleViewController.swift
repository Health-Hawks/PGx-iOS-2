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
    
    @IBOutlet weak var GeneUsed: UILabel!
    @IBOutlet weak var DrugUsed: UILabel!
    @IBOutlet weak var Allele1PickerBtn: UIButton!
    @IBOutlet weak var toMetabolizerNextButton: UIBarButtonItem!
    @IBOutlet weak var Allele2PickerBtn: UIButton!
    @IBOutlet weak var Allele1Picker: UIPickerView!
    @IBOutlet weak var Allele2Picker: UIPickerView!
    
    let allele1 = ["Select Allele", "*1", "*1S", "*2"]
    let allele2 = ["Select Allele", "*1", "*1S", "*2", "3A", "*3B", "*3C", "*4"]
    let alleleDPYD = ["Select Allele", "*Normal/No variant", "*c.557A>G", "*c.1129-5923C>G", "*c.2846A>T", "*c.295_298delTCAT", "*c.703C>T", "*c.1156G>T", "*c.1679T>G", "*c.1898delC", "*c.1905+1G>A", "*c.2983G>T" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Allele1Picker?.dataSource = self
        Allele2Picker?.dataSource = self
        Allele1Picker?.delegate = self
        Allele2Picker?.delegate = self
        GeneUsed.text = selectedGene
        DrugUsed.text = selectedDrug
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
        var alleleCount = Int()
        switch selectedGene {
        case "TPMT":
            if (pickerView == Allele1Picker && selectedGene == "TPMT") {
                alleleCount = allele1.count
            }
            else{
                alleleCount = allele2.count
                }
        case "DPYD":
            if (pickerView == Allele1Picker && selectedGene == "DPYD") {
                alleleCount = alleleDPYD.count
            }
            else{
                alleleCount = alleleDPYD.count
            }
        default:
            break
        }
        return alleleCount
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var pickerViewAllele = ""
        switch selectedGene{
        case "TPMT":
            if (pickerView == Allele1Picker){
                pickerViewAllele = allele1 [row]
            }
            else{
                pickerViewAllele = allele2 [row]
            }
        case "DPYD":
            if (pickerView == Allele1Picker){
                pickerViewAllele = alleleDPYD [row]
            }
            else{
                pickerViewAllele = alleleDPYD [row]
            }
        default: break
        }
        return pickerViewAllele
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == Allele1Picker && selectedGene == "TPMT"){
            
            Allele1PickerBtn.setTitle(allele1[row], for: UIControlState.normal)
            selectedAllele1 = allele1[row]
            Allele1Picker.isHidden = true
        }
        else if (pickerView == Allele2Picker && selectedGene == "TPMT"){
            Allele2PickerBtn.setTitle(allele2[row], for: UIControlState.normal)
            selectedAllele2 = allele2[row]
            Allele2Picker.isHidden = true
        }
        else if (pickerView == Allele1Picker && selectedGene == "DPYD"){
            Allele1PickerBtn.setTitle(alleleDPYD[row], for: UIControlState.normal)
            selectedAllele1 = alleleDPYD[row]
            Allele1Picker.isHidden = true
        }
        else if (pickerView == Allele2Picker && selectedGene == "DPYD"){
            Allele2PickerBtn.setTitle(alleleDPYD[row], for: UIControlState.normal)
            selectedAllele2 = alleleDPYD[row]
            Allele2Picker.isHidden = true
        }
            
        else{
            print("error")
        }
    }
    
    //logic for if statement to determine metabolizer pages
    //does 1S need to be *1s?!?!?
    
    @IBAction func NextBtnPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Missing Field", message: "Please make sure all fields are chosen", preferredStyle: UIAlertControllerStyle.alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        let invalidSelection = UIAlertController(title: "Invalid Selection", message: "Please select a valid allele combination", preferredStyle: UIAlertControllerStyle.alert)
            invalidSelection.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        
        
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
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*Normal/No variant"){
            performSegue(withIdentifier: "DPYD1", sender: nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*Normal/No variant"){
            performSegue(withIdentifier: "DPYD5", sender: nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*Normal/No variant"){
            performSegue(withIdentifier: "DPYD5", sender: nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*Normal/No variant"){
            performSegue(withIdentifier: "DPYD5", sender: nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*Normal/No variant"){
            performSegue(withIdentifier: "DPYD5", sender: nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*Normal/No variant"){
            performSegue(withIdentifier: "DPYD5", sender: nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*Normal/No variant"){
            performSegue(withIdentifier: "DPYD5", sender: nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.295_298delTCAT"){
            performSegue(withIdentifier: "DPYD2", sender:nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "DPYD2", sender:nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "DPYD2", sender:nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "c.1679T>G"){
            performSegue(withIdentifier: "DPYD2", sender:nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "DPYD2", sender:nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1905+1G>T"){
            performSegue(withIdentifier: "DPYD2", sender:nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "DPYD2", sender:nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.557A>G" &&  selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "DPYD2", sender: nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD2", sender: nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.557A>G") {
            performSegue(withIdentifier: "DPYD2", sender: nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "DPYD2", sender: nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD2", sender: nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.2846A>t" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD2", sender: nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.557A>G"){
            performSegue(withIdentifier: "DPYD3", sender: nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD3", sender: nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "DPYD3", sender: nil)
        }
        // other druygs intermediate
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.295_298delTCAT"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "c.1679T>G"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1905+1G>T"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.557A>G" &&  selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.557A>G") {
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.2846A>t" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.557A>G"){
            performSegue(withIdentifier: "DPYD7", sender: nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD7", sender: nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "DPYD7", sender: nil)
        }else if (selectedDrug == "Efudex" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.295_298delTCAT"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "c.1679T>G"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1905+1G>T"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.557A>G" &&  selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.557A>G") {
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.2846A>t" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.557A>G"){
            performSegue(withIdentifier: "DPYD7", sender: nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD7", sender: nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "DPYD7", sender: nil)
        }else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.295_298delTCAT"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "c.1679T>G"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1905+1G>T"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*c.557A>G" &&  selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.557A>G") {
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*c.2846A>t" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.557A>G"){
            performSegue(withIdentifier: "DPYD7", sender: nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD7", sender: nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "DPYD7", sender: nil)
        }else if (selectedDrug == "Adrucil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.295_298delTCAT"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "c.1679T>G"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1905+1G>T"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.557A>G" &&  selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.557A>G") {
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.2846A>t" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.557A>G"){
            performSegue(withIdentifier: "DPYD7", sender: nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD7", sender: nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "DPYD7", sender: nil)
        }else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.295_298delTCAT"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "c.1679T>G"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1905+1G>T"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.557A>G" &&  selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.557A>G") {
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.2846A>t" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.557A>G"){
            performSegue(withIdentifier: "DPYD7", sender: nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD7", sender: nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "DPYD7", sender: nil)
        }else if (selectedDrug == "5-FU" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.295_298delTCAT"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "c.1679T>G"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1905+1G>T"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "DPYD6", sender:nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.557A>G" &&  selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.557A>G") {
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.2846A>t" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD6", sender: nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.557A>G"){
            performSegue(withIdentifier: "DPYD7", sender: nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD7", sender: nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "DPYD7", sender: nil)
        }
        //adf
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*Normal/No variant"){
            performSegue(withIdentifier: "DPYD1", sender: nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.295_298delTCAT"){
            performSegue(withIdentifier: "DPYD2", sender:nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "DPYD2", sender:nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "DPYD2", sender:nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "c.1679T>G"){
            performSegue(withIdentifier: "DPYD2", sender:nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "DPYD2", sender:nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1905+1G>T"){
            performSegue(withIdentifier: "DPYD2", sender:nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "DPYD2", sender:nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.557A>G" &&  selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "DPYD2", sender: nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD2", sender: nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.557A>G") {
            performSegue(withIdentifier: "DPYD2", sender: nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "DPYD2", sender: nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD2", sender: nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.2846A>t" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD2", sender: nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.557A>G"){
            performSegue(withIdentifier: "DPYD3", sender: nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "DPYD3", sender: nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*Normal/No variant" && selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "DPYD3", sender: nil)
        }
            //avoid use list 1
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.295_298delTCAT"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*c.2989G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.1898delC" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.1898delC" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.1898delC" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.1905+1G>A" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.1905+1G>A" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.295_298delTCAT"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*c.2989G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.1898delC" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.1898delC" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.1898delC" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.1905+1G>A" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.1905+1G>A" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.295_298delTCAT"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*c.2989G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.1898delC" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.1898delC" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.1898delC" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.1905+1G>A" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.1905+1G>A" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.295_298delTCAT"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*c.2989G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.1898delC" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.1898delC" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.1898delC" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.1905+1G>A" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.1905+1G>A" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Flouroplex" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.295_298delTCAT"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Flouroplex" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Flouroplex" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Flouroplex" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Flouroplex" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Flouroplex" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Flouroplex" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Flouroplex" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Flouroplex" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Flouroplex" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Flouroplex" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Flouroplex" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Flouroplex" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Flouroplex" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Flouroplex" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Flouroplex" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Flouroplex" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Flouroplex" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Flouroplex" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Flouroplex" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Flouroplex" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Flouroplex" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*c.2989G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Flouroplex" && selectedAllele1 == "*c.1898delC" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Flouroplex" && selectedAllele1 == "*c.1898delC" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Flouroplex" && selectedAllele1 == "*c.1898delC" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Flouroplex" && selectedAllele1 == "*c.1905+1G>A" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Flouroplex" && selectedAllele1 == "*c.1905+1G>A" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.295_298delTCAT"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*c.2989G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.1898delC" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.1898delC" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.1898delC" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.1905+1G>A" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.1905+1G>A" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.295_298delTCAT"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*c.2989G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.1898delC" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.1898delC" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.1898delC" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.1905+1G>A" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.1905+1G>A" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.295_298delTCAT"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*1679T>G"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 == "*c.2989G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.1898delC" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.1898delC" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.1898delC" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.1905+1G>A" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.1905+1G>A" && selectedAllele2 == "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse", sender: nil)
        }
        //avoid use 2
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.557A>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.557A>G" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.703C>T" && selectedAllele2 ==  "*c.1129-5923C>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 ==  "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 ==  "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.1898delC" && selectedAllele2 ==   "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.1905+1G>A" && selectedAllele2 ==  "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.2846A>T" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "XELODA" && selectedAllele1 == "*c.2983G>T" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        } else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.557A>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.557A>G" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.703C>T" && selectedAllele2 ==  "*c.1129-5923C>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 ==  "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 ==  "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.1898delC" && selectedAllele2 ==   "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.1905+1G>A" && selectedAllele2 ==  "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.2846A>T" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Capecitabine" && selectedAllele1 == "*c.2983G>T" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        } else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.557A>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.557A>G" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.703C>T" && selectedAllele2 ==  "*c.1129-5923C>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 ==  "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 ==  "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.1898delC" && selectedAllele2 ==   "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.1905+1G>A" && selectedAllele2 ==  "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.2846A>T" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluorouracil" && selectedAllele1 == "*c.2983G>T" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        } else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.557A>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.557A>G" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.703C>T" && selectedAllele2 ==  "*c.1129-5923C>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 ==  "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 ==  "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.1898delC" && selectedAllele2 ==   "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.1905+1G>A" && selectedAllele2 ==  "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.2846A>T" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Efudex" && selectedAllele1 == "*c.2983G>T" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        } else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.557A>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*c.557A>G" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*c.703C>T" && selectedAllele2 ==  "*c.1129-5923C>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 ==  "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 ==  "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*c.1898delC" && selectedAllele2 ==   "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*c.1905+1G>A" && selectedAllele2 ==  "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*c.2846A>T" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Fluoroplex" && selectedAllele1 == "*c.2983G>T" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        } else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.557A>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.557A>G" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.703C>T" && selectedAllele2 ==  "*c.1129-5923C>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 ==  "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 ==  "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.1898delC" && selectedAllele2 ==   "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.1905+1G>A" && selectedAllele2 ==  "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.2846A>T" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "Adrucil" && selectedAllele1 == "*c.2983G>T" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        } else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.557A>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.557A>G" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.703C>T" && selectedAllele2 ==  "*c.1129-5923C>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 ==  "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 ==  "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.1898delC" && selectedAllele2 ==   "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.1905+1G>A" && selectedAllele2 ==  "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.2846A>T" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-fluorouracil" && selectedAllele1 == "*c.2983G>T" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.557A>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.1129-5923C>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.295_298delTCAT" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.703C>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.557A>G" && selectedAllele2 == "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.557A>G" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.703C>T" && selectedAllele2 ==  "*c.1129-5923C>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.703C>T" && selectedAllele2 == "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 == "*c.1156G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.1679T>G"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.1898delC"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.1905+1G>A"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.1129-5923C>G" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.1156G>T" && selectedAllele2 ==  "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.1679T>G" && selectedAllele2 ==  "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.1898delC" && selectedAllele2 ==   "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.1905+1G>A" && selectedAllele2 ==  "*c.2846A>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.2846A>T" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedDrug == "5-FU" && selectedAllele1 == "*c.2983G>T" && selectedAllele2 ==  "*c.2983G>T"){
            performSegue(withIdentifier: "avoidUse2", sender: nil)
        }
        else if (selectedAllele1 == "" || selectedAllele2 == "") {
            self.present(alert, animated: true)
        }
        else {
            self.present(invalidSelection, animated:true)
        }
    }
}


        
        
        
        

