//
//  ComposeViewController.swift
//  TwitterClient
//
//  Created by Anh Tuan on 9/30/14.
//  Copyright (c) 2014 Anh Tuan. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var messageInput: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCancel(sender: AnyObject) {
        goBack()
    }

    @IBAction func onTweet(sender: AnyObject) {
        let t = Tweet()
        t.message = messageInput.text
        
        // send the tweet

        goBack()
    }
    
    func goBack() {
        // Somehow I cannot go back if it is a push animation
        /*
        if (navigationController != nil) {
        println("not nil")
        }
        navigationController?.dismissViewControllerAnimated(true, completion: { () -> Void in
        })
        navigationController?.popViewControllerAnimated(true)
        */
        dismissViewControllerAnimated(true, completion: { () -> Void in
        })
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
