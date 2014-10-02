//
//  TwitterClientDelegate.swift
//  TwitterClient
//
//  Created by Anh Tuan on 10/1/14.
//  Copyright (c) 2014 Anh Tuan. All rights reserved.
//

import Foundation

@objc
protocol TwitterClientDelegate {
    func didAuthenticate(client: TwitterClient)
}