//
//  GetStartedViewController.swift
//  pgx_ios
//
//  Created by Shane Forler on 11/30/17.
//  Copyright © 2017 Tabor Scott. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController {

    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var wantToKnowMore: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getStartedButton.layer.cornerRadius = 25
        getStartedButton.layer.masksToBounds = true
        wantToKnowMore.layer.cornerRadius = 25
        wantToKnowMore.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func wantToKnowMorePressed(_ sender: Any) {
    }
    @IBAction func getStartedButtonPressed(_ sender: Any) {
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
