//
//  ViewController.swift
//  BEMac
//
//  Created by 孙御礼 on 2/17/30 H.
//  Copyright © 30 Heisei 孙御礼. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    //@IBOutlet weak var beview: !
    
    @IBOutlet var bewindow: BENSView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.

        }
    }

    override func viewDidAppear() {
        super.viewDidAppear()
        bewindow.renderer.setBackgroundColor(NSColor.darkGray)
        bewindow.renderer.doesDrawWireFrame = false
        bewindow.loadModelNamed("maya-blender.obj")
        bewindow.startDraw3DContent(BECameraRotateAroundModelManual)
    }
    
    override func mouseDragged(with event: NSEvent) {
        bewindow.renderer.rotateModel(byPanGesture: CGPoint.init(x: event.deltaX, y: -event.deltaY))
    }
    
    override func magnify(with event: NSEvent) {
        bewindow.renderer.zoomModel(byPinchGesture: 1.0+event.magnification)
    }

    override func smartMagnify(with event: NSEvent) {
        bewindow.renderer.zoomModel(byPinchGesture: 2.0)
    }

}

