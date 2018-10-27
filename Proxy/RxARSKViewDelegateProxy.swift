//
//  RxARSKViewDelegateProxy.swift
//  RxARKit
//
//  Created by Maxim Volgin on 22/06/2018.
//  Copyright © 2018 Maxim Volgin. All rights reserved.
//

import ARKit
#if !RX_NO_MODULE
import RxSwift
import RxCocoa
#endif

public typealias RxARSKViewDelegate = DelegateProxy<ARSKView, ARSKViewDelegate>

extension ARSKView: HasDelegate {
    public typealias Delegate = ARSKViewDelegate
}

open class RxARSKViewDelegateProxy: RxARSKViewDelegate, DelegateProxyType, ARSKViewDelegate {
    
    /// Type of parent object
    public weak private(set) var view: ARSKView?
    
    /// Init with ParentObject
    public init(parentObject: ParentObject) {
        view = parentObject
        super.init(parentObject: parentObject, delegateProxy: RxARSKViewDelegateProxy.self)
    }
    
    /// Register self to known implementations
    public static func registerKnownImplementations() {
        self.register { parent -> RxARSKViewDelegateProxy in
            RxARSKViewDelegateProxy(parentObject: parent)
        }
    }
    
    /// Gets the current `ARSKViewDelegate` on `ARSKView`
    open class func currentDelegate(for object: ParentObject) -> ARSKViewDelegate? {
        return object.delegate
    }
    
    /// Set the `ARSKViewDelegate` for `ARSKView`
    open class func setCurrentDelegate(_ delegate: ARSKViewDelegate?, to object: ParentObject) {
        object.delegate = delegate
    }
    
    // MARK: - lambda

    open var nodeForAnchor: SKNodeForAnchor = RxARSKViewDelegateProxy.defaultNodeForAnchor
    open var shouldRenderAtTime: ShouldRenderAtTime = RxARSKViewDelegateProxy.defaultShouldRenderAtTime
    
    // MARK: - default lambda
    
    static let defaultNodeForAnchor: SKNodeForAnchor = { (view, anchor) -> SKNode? in nil }
    static let defaultShouldRenderAtTime: ShouldRenderAtTime = { (view, time) -> Bool in true }
    
    
    // MARK: - ARSKViewDelegate
    
    public func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
        return self.nodeForAnchor(view, anchor)
    }
    
    // MARK: - SKViewDelegate
    
    public func view(_ view: SKView, shouldRenderAtTime time: TimeInterval) -> Bool {
        return self.shouldRenderAtTime(view, time)
    }
    
}
