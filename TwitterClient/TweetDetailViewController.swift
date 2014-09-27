//
//  TweetDetailViewController.swift
//  TwitterClient
//
//  Created by Anh Tuan on 9/26/14.
//  Copyright (c) 2014 Anh Tuan. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {
    weak var actionDelegate: TwitterActionDelegate?
    var tweet: Tweet?
    
    @IBOutlet weak var retweeter: UILabel!

    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var handle: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var time: UILabel!

    @IBOutlet weak var retweetCount: UILabel!
    @IBOutlet weak var favoriteCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        println(tweet?)
        name.text = tweet?.name
        handle.text = tweet?.handle
        message.text = tweet?.message
        time.text = "Some time ago"
        favoriteCount.text = "\(tweet?.favoriteCount?)"
        retweetCount.text = "\(tweet?.retweetCount?)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onReply(sender: AnyObject) {
        actionDelegate?.didReply(self)
        goBack()
    }

    @IBAction func onRetweet(sender: AnyObject) {
        actionDelegate?.didRetweet(self)
        goBack()
    }
    
    @IBAction func onFavorite(sender: AnyObject) {
        actionDelegate?.didFavorite(self)
        goBack()
    }

    @IBAction func onHome(sender: AnyObject) {
        goBack()
    }

    func goBack() {
        navigationController?.dismissViewControllerAnimated(true, completion: { () -> Void in
            println("done")
        })
        navigationController?.popViewControllerAnimated(true)
        if (navigationController != nil) {
            println("not nil")
        }
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
