//
//  AppDelegate.swift
//  VBNestedCollectionViewDemo
//
//  Created by Veronica Baldys on 2/2/17.
//  Copyright © 2017 VeronicaBaldys.com All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        let photosViewController = CatPhotosViewController()
        
//        let navigationController = UINavigationController(rootViewController: photosViewController)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = photosViewController
        return true
    }

}

