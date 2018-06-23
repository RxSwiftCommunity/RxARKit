//
//  ARSCNView+Rx.swift
//  RxARKit
//
//  Created by Maxim Volgin on 22/06/2018.
//  Copyright © 2018 Maxim Volgin. All rights reserved.
//

import ARKit
import RxSwift
import RxCocoa

extension Reactive where Base: ARSCNView {
    /// Reactive wrapper for `delegate`.
    /// For more information take a look at `DelegateProxyType` protocol documentation.
    public var delegate: DelegateProxy<ARSCNView, ARSCNViewDelegate> {
        return RxARSCNViewDelegateProxy.proxy(for: base)
    }
    
    /// Installs delegate as forwarding delegate on `delegate`.
    /// Delegate won't be retained.
    ///
    /// It enables using normal delegate mechanism with reactive delegate mechanism.
    ///
    /// - parameter delegate: Delegate object.
    /// - returns: Disposable object that can be used to unbind the delegate.
    public func setDelegate(_ delegate: ARSCNViewDelegate)
        -> Disposable {
            return RxARSCNViewDelegateProxy.installForwardDelegate(delegate, retainDelegate: false, onProxyForObject: self.base)
    }
    
    // MARK:- ARSCNViewDelegate
    
    // Reactive wrapper for delegate method `renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode?`
//    public var didUpdateFrame: ControlEvent<ARFrame> {
//        let source = delegate
//            .methodInvoked(#selector(ARSCNViewDelegate.renderer(_:nodeFor:)))
//            .map { value -> ARFrame in
//                return try castOrThrow(ARFrame.self, value[1] as AnyObject)
//        }
//        return ControlEvent(events: source)
//    }

    
//    optional public func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode?
//    optional public func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor)
//    optional public func renderer(_ renderer: SCNSceneRenderer, willUpdate node: SCNNode, for anchor: ARAnchor)
//    optional public func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor)
//    optional public func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor)

}

