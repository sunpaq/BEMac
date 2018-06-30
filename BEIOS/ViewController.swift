//
//  ViewController.swift
//  BEIOS
//
//  Created by 孙御礼 on 6/10/30 H.
//  Copyright © 30 Heisei 孙御礼. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BEViewRenderingDelegate {
    @IBOutlet var bewindow: BEView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bewindow.delegate = self
        bewindow.renderer.setBackgroundColor(UIColor.darkGray)
        bewindow.renderer.doesDrawWireFrame = false
        bewindow.loadModelNamed("maya-blender.obj")
        bewindow.startDraw3DContent(BECameraRotateAroundModelManual)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func beforeRenderFrame() {
        
    }
    
    func afterRenderFrame() {
        //handleGameController(bewindow.renderer)
    }
    
    @IBAction func onPan(_ sender: UIPanGestureRecognizer) {
        let trans = sender.translation(in: self.view)
        bewindow.renderer.rotateModel(byPanGesture: trans)
    }
    
    @IBAction func onPinch(_ sender: UIPinchGestureRecognizer) {
        let zoom = sender.scale
        bewindow.renderer.zoomModel(byPinchGesture: zoom)
    }
}

