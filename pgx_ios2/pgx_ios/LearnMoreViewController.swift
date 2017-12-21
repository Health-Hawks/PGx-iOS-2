//
//  LearnMoreViewController.swift
//  pgx_ios
//
//  Created by James Gray on 12/20/17.
//  Copyright © 2017 Tabor Scott. All rights reserved.
//

import UIKit

class LearnMoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDown)
    }

    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.down:
                performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.down)
                print("Swiped down")
            case UISwipeGestureRecognizerDirection.left:
                performSegue(withIdentifier: "toGeneticTest", sender: UISwipeGestureRecognizerDirection.left)
                print("Swiped left")
            case UISwipeGestureRecognizerDirection.up:
                performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.up)
                print("Swiped up")
            default:
                break
            }
        }
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


//if presentedViewController?.title == "BasicGenetics" {
//    switch swipeGesture.direction {
//    case UISwipeGestureRecognizerDirection.right:
//        print("right")
//    case UISwipeGestureRecognizerDirection.down:
//        performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.down)
//        print("down")
//    case UISwipeGestureRecognizerDirection.left:
//        performSegue(withIdentifier: "toGeneticTest", sender: UISwipeGestureRecognizerDirection.left)
//        print("left")
//    case UISwipeGestureRecognizerDirection.up:
//        performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.up)
//        print("up")
//    default:
//        break
//    }
//}
//else if presentedViewController?.title == "GeneticTests" {
//    switch swipeGesture.direction {
//    case UISwipeGestureRecognizerDirection.right:
//        performSegue(withIdentifier: "toBasicGenetics", sender: UISwipeGestureRecognizerDirection.right)
//    case UISwipeGestureRecognizerDirection.down:
//        performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.down)
//    case UISwipeGestureRecognizerDirection.left:
//        performSegue(withIdentifier: "toWhyIndividuals", sender: UISwipeGestureRecognizerDirection.left)
//    case UISwipeGestureRecognizerDirection.up:
//        performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.up)
//    default:
//        break
//    }
//}
//else if presentedViewController?.title == "WhyIndividuals" {
//    switch swipeGesture.direction {
//    case UISwipeGestureRecognizerDirection.right:
//        performSegue(withIdentifier: "toWhyIndividuals", sender: UISwipeGestureRecognizerDirection.right)
//    case UISwipeGestureRecognizerDirection.down:
//        performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.down)
//    case UISwipeGestureRecognizerDirection.left:
//        performSegue(withIdentifier: "toWhyIndividCont", sender: UISwipeGestureRecognizerDirection.left)
//    case UISwipeGestureRecognizerDirection.up:
//        performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.up)
//    default:
//        break
//    }
//}
//}
//}

