//
//  MainViewController.swift
//  TwitterClient
//
//  Created by Anh Tuan on 9/26/14.
//  Copyright (c) 2014 Anh Tuan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TwitterActionDelegate {
    @IBOutlet weak var tableView: UITableView!
    var refresh: UIRefreshControl!
    var tweets: [Tweet]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        refresh = UIRefreshControl()
        self.refresh.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        tableView.addSubview(refresh)
        
        var t = Tweet()
        t.name = "Jeremy"
        t.handle = "jeremy"
        t.message = "I just saw something!"
        tweets = [t]
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func refresh(sender:AnyObject) {
        // refresh tweets
//        self.tableView.reloadData()
        
        self.refresh.endRefreshing()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let c = tweets?.count {
            return c
        }
        return 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("TweetCell") as TweetTableViewCell
        cell.tweet = tweets?[indexPath.row]
        cell.awakeFromNib()
        return cell
    }
    
    func didReply(controller: UIViewController) -> Void {
    }
    func didRetweet(controller: UIViewController) -> Void {
    
    }
    func didFavorite(controller: UIViewController) -> Void {
        
    }

    // to pass itself as the Reply/Retweet/Fave protocol
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destinationViewController = segue.destinationViewController as UINavigationController
        
        var tweetDetailViewController = destinationViewController.viewControllers[0] as TweetDetailViewController
        var tableViewCell = sender as UITableViewCell
        let index = tableView.indexPathForCell(tableViewCell)
        let row = index?.row
        tweetDetailViewController.tweet = tweets?[row!]
//        destinationViewController.delegate = self
    }

}
