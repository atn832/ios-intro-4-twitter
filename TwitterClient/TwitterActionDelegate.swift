//
//  TwitterActionDelegate.swift
//  TwitterClient
//
//  Created by Anh Tuan on 9/26/14.
//  Copyright (c) 2014 Anh Tuan. All rights reserved.
//

import Foundation

@objc protocol TwitterActionDelegate {
    // @objc is needed to make delegates nullable
    func didReply(controller: UIViewController) -> Void
    func didRetweet(controller: UIViewController) -> Void
    func didFavorite(controller: UIViewController) -> Void
}
