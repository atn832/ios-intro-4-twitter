//
//  TwitterClient.swift
//  TwitterClient
//
//  Created by Anh Tuan on 9/25/14.
//  Copyright (c) 2014 Anh Tuan. All rights reserved.
//

import UIKit

class TwitterClient: NSObject, UIApplicationDelegate {
    var networkManager: BDBOAuth1RequestOperationManager!
    var consumerKey: String!
    var consumerSecret: String!
    
    init(consumerKey: String!, consumerSecret: String!) {
        self.consumerKey = consumerKey
        self.consumerSecret = consumerSecret

        networkManager = BDBOAuth1RequestOperationManager(baseURL: NSURL.URLWithString("https://api.twitter.com/oauth/request_token"), consumerKey: consumerKey, consumerSecret: consumerSecret)
        networkManager.fetchRequestTokenWithPath("/oauth/request_token", method: "POST", callbackURL: NSURL.URLWithString("twitterclient://request"), scope: nil, success: { (requestToken: BDBOAuthToken!) -> Void in
            println(requestToken)
            //            NSString *authURL = [NSString stringWithFormat:@"https://api.twitter.com/oauth/authorize?oauth_token=%@", requestToken.token];
            //            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:authURL]];
            let authURL = "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken.token)"
            UIApplication.sharedApplication().openURL(NSURL.URLWithString(authURL))
            }) { (error: NSError!) -> Void in
                println(error)
            }

        
//        var baseUrl = NSURL(string: "http://api.yelp.com/v2/")
//        super.init(baseURL: baseUrl, consumerKey: key, consumerSecret: secret);
//        
//        var token = BDBOAuthToken(token: accessToken, secret: accessSecret, expiration: nil)
//        self.requestSerializer.saveAccessToken(token)
    }
    
    func search() -> [Tweet] {
        return []
    }

    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String, annotation: AnyObject?) -> Bool {
        println(url)
        println(annotation)
        if url.scheme? === "twitterclient" {
            if url.host? === "request" {
                let parameters = url.dictionaryWithValuesForKeys(["oauth_token", "oauth_verifier"])
                if (parameters["oauth_token"] != nil && parameters["oauth_verifier"] != nil) {
                    println("something")
                    networkManager.fetchAccessTokenWithPath("/oauth/access_token", method: "POST", requestToken: BDBOAuthToken(queryString: url.query), success: { (authToken: BDBOAuthToken!) -> Void in
                        println(authToken)
                        }, failure: { (error: NSError!) -> Void in
                        println(error)
                    })
                }
                
            }
            println("yes")
            return true;
        }
        println("no")
        return false;
    }
    

}
