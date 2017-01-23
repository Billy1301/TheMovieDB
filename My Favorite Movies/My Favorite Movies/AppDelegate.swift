//
//  AppDelegate.swift
//  My Favorite Movies
//
//  Created by Billy on 1/20/17.
//  Copyright © 2017 Billy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var sharedSession = URLSession.shared
    var requestToken: String? = nil
    var sessionID: String? = nil
    var userID: Int? = nil
    
    // configuration for TheMovieDB, we'll take care of this for you =)...
    var config = Config()
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]? = nil) -> Bool {
        config.updateIfDaysSinceUpdateExceeds(7)
        return true
    }
}

// MARK: Create URL from Parameters

extension AppDelegate {
    
    func tmdbURLFromParameters(_ parameters: [String:AnyObject], withPathExtension: String? = nil) -> URL {
        
        var components = URLComponents()
        components.scheme = Constants.TMDB.ApiScheme
        components.host = Constants.TMDB.ApiHost
        components.path = Constants.TMDB.ApiPath + (withPathExtension ?? "")
        components.queryItems = [URLQueryItem]()
        
        for (key, value) in parameters {
            let queryItem = URLQueryItem(name: key, value: "\(value)")
            components.queryItems!.append(queryItem)
        }
        
        return components.url!
    }
}

