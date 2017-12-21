//
//  DrugViewController.swift
//  pgx_ios
//
//  Created by Tabor Scott on 10/11/17.
//  Copyright © 2017 Tabor Scott. All rights reserved.
//

import UIKit

class DrugViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    var selectedDrug = ""
    var selectedGene = ""
    
    @IBOutlet weak var GenePicker: UIPickerView!
    @IBOutlet weak var GenePickerBtn: UIButton!
    
    @IBOutlet weak var DrugPicker: UIPickerView!
    @IBOutlet weak var DrugPickerBtn: UIButton!
    
    @IBOutlet weak var backButtonToGetStarted: UIBarButtonItem!
    @IBOutlet weak var nextButtonToAllele: UIBarButtonItem!
    
    
    let genes = ["", "TPMT"] //Add additional drugs here later
    let drugs = ["", "Mercaptopurine", "6MP", "Purinethol", "Purixan", "6Mercaptopurine", "Thioguanine", "6TG", "6Thioguanine", "Tabloid", "Azathioprine", "Azasan", "Imuran"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        GenePicker?.dataSource = self
        GenePicker?.delegate = self
        DrugPicker?.dataSource = self
        DrugPicker?.delegate = self
        //self.GenePicker.selectRow(0, inComponent:0, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func GenePickerBtnPressed(_ sender: AnyObject) {
        GenePicker.isHidden = false;
        DrugPicker.isHidden = true
    }
    

    @IBAction func DrugPickerBtnPressed(_ sender: Any) {
        DrugPicker.isHidden = false;
        GenePicker.isHidden = true
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
            //self.pickerView(GenePicker, didSelectRow: 0, inComponent: 0)
            GenePickerBtn.setTitle(genes[row], for: UIControlState.normal)
            selectedGene = genes[row]
            GenePicker.isHidden = true
        }
        else if (pickerView == DrugPicker){
       
            DrugPickerBtn.setTitle(drugs[row], for: UIControlState.normal)
            selectedDrug = drugs[row]
            DrugPicker.isHidden = true
        }
        else{
            print("error")
        }
    }
    @IBAction func drugNextPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "AlleleViewController", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let alert = UIAlertController(title: "Missing Field", message: "Please make sure all fields are chosen", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        if let buttonPressed = sender as? UIBarButtonItem {
            if buttonPressed == nextButtonToAllele {
                if selectedGene == "" || selectedDrug == "" {
                    self.present(alert, animated: true)
                }else {
                let destinationVC = segue.destination as! AlleleViewController
                destinationVC.selectedGene = selectedGene
                destinationVC.selectedDrug = selectedDrug
                    
                }
                
            }else {
                performSegue(withIdentifier: "backToGetStarted", sender: backButtonToGetStarted)
            }
            
        }
    }
        
}

