//
//  TweetTableViewCell.swift
//  TwitterClient
//
//  Created by Anh Tuan on 9/26/14.
//  Copyright (c) 2014 Anh Tuan. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    var tweet: Tweet?
//    var profilePictureUrl: String?
//    var name: String?
//    var handle: String?
//    var text: String?
//    var datetime: TimeRecord?
//    var retweetCount: Int?
//    var favoriteCount: Int?
//    var retweeterHandle: String?

    @IBOutlet weak var retweeterLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var handle: UILabel!
    @IBOutlet weak var message: UILabel!
    
    @IBOutlet weak var retweetedIcon: UIImageView!
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        name.text = tweet?.name
        handle.text = tweet?.handle
        message.text = tweet?.message
        let url = tweet?.profilePictureUrl
        if (url != nil) {
            profileImage.setImageWithURL(NSURL.URLWithString(url!))
        }
        
        let now = NSDate()
        let createdAt = tweet?.createdAt
        if (createdAt != nil) {
            let hours = now.timeIntervalSinceDate(createdAt!) / 3600
            let fullHours = Int(hours)
            let minutes = Int(60 * (hours - Double(fullHours)))
            if (fullHours < 10) {
                time.text = "\(fullHours)h\(minutes)min ago"
            }
            else if (fullHours < 24) {
                time.text = "\(fullHours)h ago"
            }
            else {
                time.text = "\(fullHours / 24)d ago"
            }
        }
        else {
            time.text = "Some time ago"
        }
        retweeterLabel.hidden = true
        
        let viewsDictionary = [
            "retweetedIcon": retweetedIcon,
            "retweetLabel": retweeterLabel
        ]
        let label_constraint_V:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("V:[retweetLabel(0)]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let icon_constraint_V:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("V:[retweetedIcon(0)]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        retweeterLabel.addConstraints(label_constraint_V)
        retweetedIcon.addConstraints(icon_constraint_V)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
