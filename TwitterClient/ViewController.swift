//
//  ViewController.swift
//  TwitterClient
//
//  Created by Anh Tuan on 9/24/14.
//  Copyright (c) 2014 Anh Tuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TwitterClientDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogin(sender: AnyObject) {
        TwitterClient.sharedInstance.delegate = self
        TwitterClient.sharedInstance.fetchRequestTokenWithPath()
    }
    
    func didAuthenticate(client: TwitterClient) {
        performSegueWithIdentifier("ToMainSegue", sender: self)
    }
}

