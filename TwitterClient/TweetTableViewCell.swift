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
        time.text = "Some time ago" //tweet?.datetime
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
