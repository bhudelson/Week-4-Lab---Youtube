//
//  HamburgerViewController.swift
//  Week 4 Lab - Youtube
//
//  Created by Blake Hudelson on 2/24/16.
//  Copyright © 2016 Blake Hudelson. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {

    @IBOutlet weak var feedView: UIView!
    @IBOutlet weak var menuView: UIView!
    
    var menuViewController: UIViewController!
    var feedViewController: UIViewController!
    
    var menuViewInitialCenter: CGPoint!
    var feedViewInitialCenter: CGPoint!
    var swipedRightPosition: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        menuViewController = storyboard.instantiateViewControllerWithIdentifier("MenuViewController") as! MenuViewController
        feedViewController = storyboard.instantiateViewControllerWithIdentifier("FeedViewController") as! FeedViewController
        
//       swipedRightPosition = feedView.center
        
        self.addChildViewController(menuViewController)
        self.addChildViewController(feedViewController)
        
        view.addSubview(menuViewController.view)
        view.addSubview(feedViewController.view)
        
        menuViewController.didMoveToParentViewController(self)
        feedViewController.didMoveToParentViewController(self)
        
        
    }
    
    @IBAction func onFeedPan(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(view)
        let velocity = sender.velocityInView(view)
        
        //Began
        if sender.state == UIGestureRecognizerState.Began {
            
            feedViewInitialCenter = feedView.center
            }
        
        
        //Changed
        else if sender.state == UIGestureRecognizerState.Changed {
            print("hey there")
                feedView.center = CGPoint(x: translation.x + feedViewInitialCenter.x, y: feedViewInitialCenter.y)
                }
            
        
    
                
            //Ended
            else if sender.state == UIGestureRecognizerState.Ended {
//            if velocity.y > 0 {
//                UIView.animateWithDuration(0.3, animations: { () -> Void in
//                    self.feedView.center = self.swipedRightPosition
//                })
//            }
            
            }
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

