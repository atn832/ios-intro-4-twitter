//
//  TwitterClient.swift
//  TwitterClient
//
//  Created by Anh Tuan on 9/25/14.
//  Copyright (c) 2014 Anh Tuan. All rights reserved.
//

import UIKit

let ConsumerKey = "hlbGIuUjwpZHX2MKxoKiymo6c"
let ConsumerSecret = "8AiaZKXaoITD2QeFfpJRd94y7aPtNt62QKF3EdFj1eKzoQ1wVH"

class TwitterClient: NSObject {

    var networkManager: BDBOAuth1RequestOperationManager!
    var consumerKey: String!
    var consumerSecret: String!
    
    class var sharedInstance: TwitterClient {
        struct Static {
            static let instance = TwitterClient(consumerKey: ConsumerKey, consumerSecret: ConsumerSecret)
        }
        return Static.instance
    }
    
    init(consumerKey: String!, consumerSecret: String!) {
        self.consumerKey = consumerKey
        self.consumerSecret = consumerSecret

        networkManager = BDBOAuth1RequestOperationManager(baseURL: NSURL.URLWithString("https://api.twitter.com"), consumerKey: consumerKey, consumerSecret: consumerSecret)

        
//        var baseUrl = NSURL(string: "http://api.yelp.com/v2/")
//        super.init(baseURL: baseUrl, consumerKey: key, consumerSecret: secret);
//        
//        var token = BDBOAuthToken(token: accessToken, secret: accessSecret, expiration: nil)
//        self.requestSerializer.saveAccessToken(token)
    }
    
    func fetchRequestTokenWithPath() {
        networkManager.requestSerializer.removeAccessToken()
        networkManager.fetchRequestTokenWithPath("oauth/request_token", method: "GET", callbackURL: NSURL.URLWithString("twitterclient://request"), scope: nil, success: { (requestToken: BDBOAuthToken!) -> Void in
            println(requestToken)
            //            NSString *authURL = [NSString stringWithFormat:@"https://api.twitter.com/oauth/authorize?oauth_token=%@", requestToken.token];
            //            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:authURL]];
            let authURL = "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken.token)"
            UIApplication.sharedApplication().openURL(NSURL.URLWithString(authURL))
            }) { (error: NSError!) -> Void in
                println(error)
        }
    }
    
    func search() -> [Tweet] {
        return []
    }

}
