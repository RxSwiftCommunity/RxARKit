//
//  RxARSessionObserverProxy.swift
//  RxARKit
//
//  Created by Maxim Volgin on 23/06/2018.
//  Copyright © 2018 Maxim Volgin. All rights reserved.
//

import ARKit
#if !RX_NO_MODULE
import RxSwift
import RxCocoa
#endif

public typealias RxARSessionObserver = DelegateProxy<ARSession, ARSessionObserver>

//extension ARSession: HasDelegate {
//    public typealias Delegate = ARSessionDelegate
//}

open class RxARSessionObserverProxy: RxARSessionObserver, DelegateProxyType, ARSessionObserver {
    
    /// Type of parent object
    public weak private(set) var session: ARSession?
    
    /// Init with ParentObject
    public init(parentObject: ParentObject) {
        session = parentObject
        super.init(parentObject: parentObject, delegateProxy: RxARSessionObserverProxy.self)
    }
    
    /// Register self to known implementations
    public static func registerKnownImplementations() {
        self.register { parent -> RxARSessionObserverProxy in
            RxARSessionDelegateProxy(parentObject: parent)
        }
    }
    
    /// Gets the current `ARSessionObserver` on `ARSession`
    open class func currentDelegate(for object: ParentObject) -> ARSessionObserver? {
        return object.delegate
    }
    
    /// Set the `ARSessionObserver` for `ARSession`
    open class func setCurrentDelegate(_ delegate: ARSessionObserver?, to object: ParentObject) {
        object.delegate = delegate
    }
}
