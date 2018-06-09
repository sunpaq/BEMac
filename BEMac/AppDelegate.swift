//
//  AppDelegate.swift
//  BEMac
//
//  Created by 孙御礼 on 2/17/30 H.
//  Copyright © 30 Heisei 孙御礼. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        BEResource.shared().detectObjModelNames()
        BEResource.shared().preloadTGATextures()
        
        BEGameController.shared().stickFactor = 10.0
        BEGameController.shared().startUsingGameController()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

}

