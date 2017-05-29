//
//  NavigationUtil.swift
//  Namaskar
//
//  Created by Alex Mercer on 17/09/16.
//  Copyright © 2016 Thinklab. All rights reserved.
//

import Foundation
import UIKit
struct NavigationUtil {
    /**
     Presents the main view controller
     */
    static func presentMainViewController(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.initcontroller()
        
    }
}
