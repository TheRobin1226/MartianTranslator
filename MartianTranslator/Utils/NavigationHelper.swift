//
//  NavigationHelper.swift
//  MartianTranslator
//
//  Created by Marcus  Robinson on 1/19/20.
//  Copyright © 2020 Marcus  Robinson. All rights reserved.
//

import Foundation
import UIKit

class NavigationHelper {
    
    static func setRootViewController(withViewController: UIViewController) {
        let navigationController = UINavigationController(rootViewController: withViewController)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        appDelegate.window?.rootViewController = navigationController
        appDelegate.window?.makeKeyAndVisible()
    }
}
