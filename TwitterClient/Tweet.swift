//
//  Tweet.swift
//  TwitterClient
//
//  Created by Anh Tuan on 9/26/14.
//  Copyright (c) 2014 Anh Tuan. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    var profilePictureUrl: String?
    var name: String?
    var handle: String?
    var message: String?
    var datetime: TimeRecord?
    var retweetCount: Int?
    var favoriteCount: Int?
    var retweeterHandle: String?
}
