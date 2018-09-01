//
//  MTViewController.swift
//  BEMac
//
//  Created by 孙御礼 on 7/28/30 H.
//  Copyright © 30 Heisei 孙御礼. All rights reserved.
//

import Cocoa

class MTViewController: NSViewController {

    @IBOutlet var bewindow: BEMTView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        bewindow.loadModelNamed("monkey.obj")
    }
    
}
