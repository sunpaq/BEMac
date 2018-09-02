//
//  ViewController.swift
//  BEMac
//
//  Created by 孙御礼 on 2/17/30 H.
//  Copyright © 30 Heisei 孙御礼. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, BENSViewRenderingDelegate {
    
    @IBOutlet var bewindow: BENSView!
    
    var zoomLock = false;
    
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
                
        bewindow.delegate = self
        bewindow.renderer.setBackgroundColor(NSColor.darkGray)
        bewindow.renderer.doesDrawWireFrame = false
        //bewindow.loadModelNamed("monkey.obj")
        //bewindow.loadModelNamed("arcanegolem.obj")
        //bewindow.loadModelNamed("maya.obj")
        bewindow.loadModelNamed("maya-blender.obj")
        bewindow.startDraw3DContent(BECameraRotateAroundModelManual)
    }
    
    func beforeRenderFrame() {

    }
    
    func afterRenderFrame() {
        handleGameController(bewindow.renderer)
    }
    
    func handleGameController(_ ren: BERenderer!) {
        if let bec = BEGameController.shared() {
            if bec.conneted {
                if let controller = bec.gameController {
                    ren.rotateModel(byPanGesture: CGPoint(x:bec.leftStick.x, y:0))
                    ren.rotateModel(byPanGesture: CGPoint(x:0, y:bec.rightStick.y))
                    
                    if let trigger = controller.extendedGamepad?.leftTrigger {
                        if trigger.isPressed {
                            ren.doesDrawWireFrame = true
                        } else {
                            ren.doesDrawWireFrame = false
                        }
                    }
                    if let trigger = controller.extendedGamepad?.rightTrigger {
                        if trigger.isPressed {
                            if zoomLock == false {
                                ren.cameraTranslate(GLKVector3.init(v: (0,0,(1-trigger.value)*3+1)), incremental: true)
                            }
                            if let L1 = controller.extendedGamepad?.leftShoulder {
                                if L1.isPressed {
                                    zoomLock = true
                                }
                            }
                        } else {
                            if zoomLock == false {
                                ren.cameraTranslate(GLKVector3.init(v: (0,0,4)), incremental: true)
                            }
                            if let L1 = controller.extendedGamepad?.leftShoulder {
                                if L1.isPressed {
                                    zoomLock = false
                                }
                            }
                        }
                    }
                    if let L2 = controller.extendedGamepad?.rightShoulder {
                        if L2.isPressed {
                            
                        }
                    }
                }
            }
        }
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

