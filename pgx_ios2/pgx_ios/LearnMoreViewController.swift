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
            switch restorationIdentifier {
            case "intro1"?:
                switch swipeGesture.direction {
                case UISwipeGestureRecognizerDirection.down:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.down)
                case UISwipeGestureRecognizerDirection.left:
                    performSegue(withIdentifier: "toIntro2", sender: UISwipeGestureRecognizerDirection.left)
                case UISwipeGestureRecognizerDirection.up:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.up)
                default:
                    break
                }
            case "intro2"?:
                switch swipeGesture.direction {
                case UISwipeGestureRecognizerDirection.right:
                    performSegue(withIdentifier: "backToIntro1", sender: UISwipeGestureRecognizerDirection.right)
                case UISwipeGestureRecognizerDirection.down:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.down)
                case UISwipeGestureRecognizerDirection.left:
                    performSegue(withIdentifier: "toIntro3", sender: UISwipeGestureRecognizerDirection.left)
                case UISwipeGestureRecognizerDirection.up:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.up)
                default:
                    break
                }
            case "intro3"?:
                switch swipeGesture.direction {
                case UISwipeGestureRecognizerDirection.right:
                    performSegue(withIdentifier: "backToIntro2", sender: UISwipeGestureRecognizerDirection.right)
                case UISwipeGestureRecognizerDirection.down:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.down)
                case UISwipeGestureRecognizerDirection.left:
                    performSegue(withIdentifier: "toIntro4", sender: UISwipeGestureRecognizerDirection.left)
                case UISwipeGestureRecognizerDirection.up:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.up)
                default:
                    break
                }
            case "intro4"?:
                switch swipeGesture.direction {
                case UISwipeGestureRecognizerDirection.right:
                    performSegue(withIdentifier: "backToIntro3", sender: UISwipeGestureRecognizerDirection.right)
                case UISwipeGestureRecognizerDirection.down:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.down)
                case UISwipeGestureRecognizerDirection.left:
                    performSegue(withIdentifier: "toLearn1", sender: UISwipeGestureRecognizerDirection.left)
                case UISwipeGestureRecognizerDirection.up:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.up)
                default:
                    break
                }
            case "learn1"?:
                switch swipeGesture.direction {
                case UISwipeGestureRecognizerDirection.down:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.down)
                case UISwipeGestureRecognizerDirection.left:
                    performSegue(withIdentifier: "toGeneticTest", sender: UISwipeGestureRecognizerDirection.left)
                case UISwipeGestureRecognizerDirection.right:
                    performSegue(withIdentifier: "backToIntro4", sender: UISwipeGestureRecognizerDirection.right)
                case UISwipeGestureRecognizerDirection.up:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.up)
                default:
                    break
                }
            case "learn2"?:
                switch swipeGesture.direction {
                case UISwipeGestureRecognizerDirection.right:
                    performSegue(withIdentifier: "toBasicGenetics", sender: UISwipeGestureRecognizerDirection.right)
                case UISwipeGestureRecognizerDirection.down:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.down)
                case UISwipeGestureRecognizerDirection.left:
                    performSegue(withIdentifier: "toWhyIndividuals", sender: UISwipeGestureRecognizerDirection.left)
                case UISwipeGestureRecognizerDirection.up:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.up)
                default:
                    break
                }
            case "learn3"?:
                switch swipeGesture.direction {
                case UISwipeGestureRecognizerDirection.right:
                    performSegue(withIdentifier: "toGeneticTests", sender: UISwipeGestureRecognizerDirection.right)
                case UISwipeGestureRecognizerDirection.down:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.down)
                case UISwipeGestureRecognizerDirection.left:
                    performSegue(withIdentifier: "toWhyIndividCont", sender: UISwipeGestureRecognizerDirection.left)
                case UISwipeGestureRecognizerDirection.up:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.up)
                default:
                    break
                }
            case "learn4"?:
                switch swipeGesture.direction {
                case UISwipeGestureRecognizerDirection.right:
                    performSegue(withIdentifier: "toWhyIndividuals", sender: UISwipeGestureRecognizerDirection.right)
                case UISwipeGestureRecognizerDirection.down:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.down)
                case UISwipeGestureRecognizerDirection.left:
                    performSegue(withIdentifier: "toTypes", sender: UISwipeGestureRecognizerDirection.left)
                case UISwipeGestureRecognizerDirection.up:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.up)
                default:
                    break
                }
            case "learn5"?:
                switch swipeGesture.direction {
                case UISwipeGestureRecognizerDirection.right:
                    performSegue(withIdentifier: "toCont", sender: UISwipeGestureRecognizerDirection.right)
                case UISwipeGestureRecognizerDirection.down:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.down)
                case UISwipeGestureRecognizerDirection.left:
                    performSegue(withIdentifier: "toParentDrug", sender: UISwipeGestureRecognizerDirection.left)
                case UISwipeGestureRecognizerDirection.up:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.up)
                default:
                    break
                }
            case "learn6"?:
                switch swipeGesture.direction {
                case UISwipeGestureRecognizerDirection.right:
                    performSegue(withIdentifier: "toTypes", sender: UISwipeGestureRecognizerDirection.right)
                case UISwipeGestureRecognizerDirection.down:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.down)
                case UISwipeGestureRecognizerDirection.left:
                    performSegue(withIdentifier: "toEvid", sender: UISwipeGestureRecognizerDirection.left)
                case UISwipeGestureRecognizerDirection.up:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.up)
                default:
                    break
                }
            case "learn7"?:
                switch swipeGesture.direction {
                case UISwipeGestureRecognizerDirection.right:
                    performSegue(withIdentifier: "toParentDrug", sender: UISwipeGestureRecognizerDirection.right)
                case UISwipeGestureRecognizerDirection.down:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.down)
                case UISwipeGestureRecognizerDirection.left:
                    performSegue(withIdentifier: "toEducational", sender: UISwipeGestureRecognizerDirection.left)
                case UISwipeGestureRecognizerDirection.up:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.up)
                default:
                    break
                }
            case "learn8"?:
                switch swipeGesture.direction {
                case UISwipeGestureRecognizerDirection.right:
                    performSegue(withIdentifier: "toEvidence", sender: UISwipeGestureRecognizerDirection.right)
                case UISwipeGestureRecognizerDirection.down:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.down)
                case UISwipeGestureRecognizerDirection.up:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.up)
                default:
                    break
                }
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



