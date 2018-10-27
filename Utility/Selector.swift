//
//  Selector.swift
//  RxARKit
//
//  Created by Maxim Volgin on 27/10/2018.
//  Copyright © 2018 Maxim Volgin. All rights reserved.
//

import ARKit

// MARK: - ARSessionObserver

extension Selector {
    static let didFailWithError = #selector(ARSessionObserver.session(_:didFailWithError:))
    static let cameraDidChangeTrackingState = #selector(ARSessionObserver.session(_:cameraDidChangeTrackingState:))
    static let sessionWasInterrupted = #selector(ARSessionObserver.sessionWasInterrupted(_:))
    static let sessionInterruptionEnded = #selector(ARSessionObserver.sessionInterruptionEnded(_:))
    static let sessionShouldAttemptRelocalization = #selector(ARSessionObserver.sessionShouldAttemptRelocalization(_:))
    static let didOutputAudioSampleBuffer = #selector(ARSessionObserver.session(_:didOutputAudioSampleBuffer:))
}

// MARK: - ARSessionDelegate

extension Selector {
    static let didUpdateFrame = #selector(ARSessionDelegate.session(_:didUpdate:) as ((ARSessionDelegate) -> (ARSession, ARFrame) -> Void)?)
    static let didAddAnchors = #selector(ARSessionDelegate.session(_: didAdd:))
    static let didUpdateAnchors = #selector(ARSessionDelegate.session(_: didUpdate:) as ((ARSessionDelegate) -> (ARSession, [ARAnchor]) -> Void)?)
    static let didRemoveAnchors = #selector(ARSessionDelegate.session(_: didRemove:))
}

// MARK: - ARSKViewDelegate

extension Selector {
    static let didAddNodeForAnchor = #selector(ARSKViewDelegate.view(_:didAdd:for:))
    static let willUpdateNodeForAnchor = #selector(ARSKViewDelegate.view(_:willUpdate:for:))
    static let didUpdateNodeForAnchor = #selector(ARSKViewDelegate.view(_:didUpdate:for:))
    static let didRemoveNodeForAnchor = #selector(ARSKViewDelegate.view(_:didRemove:for:))
}

// MARK: - SKViewDelegate

// MARK: - ARSCNViewDelegate

extension Selector {
//optional public func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode?
//optional public func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor)
//optional public func renderer(_ renderer: SCNSceneRenderer, willUpdate node: SCNNode, for anchor: ARAnchor)
//optional public func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor)
//optional public func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor)
}

// MARK: - SCNSceneRendererDelegate

extension Selector {
//    optional public func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval)
//    optional public func renderer(_ renderer: SCNSceneRenderer, didApplyAnimationsAtTime time: TimeInterval)
//    optional public func renderer(_ renderer: SCNSceneRenderer, didSimulatePhysicsAtTime time: TimeInterval)
//    optional public func renderer(_ renderer: SCNSceneRenderer, didApplyConstraintsAtTime time: TimeInterval)
//    optional public func renderer(_ renderer: SCNSceneRenderer, willRenderScene scene: SCNScene, atTime time: TimeInterval)
//    optional public func renderer(_ renderer: SCNSceneRenderer, didRenderScene scene: SCNScene, atTime time: TimeInterval)
}
