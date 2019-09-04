//
//  ViewController.swift
//  ARKit_planeDetection
//
//  Created by Hiroki Ikeuchi on 2019/09/05.
//  Copyright © 2019 ikeh1024. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Set the scene to the view
        sceneView.scene = SCNScene()
        
        // ワイヤーフレームを表示
        sceneView.debugOptions = .showWireframe // ノードのワイヤーフレームを表示する
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // 平面の検出を有効化する
        configuration.planeDetection = .horizontal
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        // 平面アンカーでないときは中断する
        guard let planeAnchor = anchor as? ARPlaneAnchor else {
            return
        }
        // アンカーが示す位置に平面ノードを追加する
        node.addChildNode(PlaneNode(anchor: planeAnchor))
    }
    
    // ノードが更新された
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor else {
            return
        }
        guard let planeNode = node.childNodes.first as? PlaneNode else {
            return
        }
        // ノードの位置とサイズを更新する
        planeNode.update(anchor: planeAnchor)
    }
    
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
