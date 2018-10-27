//
//  RxARSessionDelegateProxy.swift
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

public typealias RxARSessionDelegate = DelegateProxy<ARSession, ARSessionDelegate>

extension ARSession: HasDelegate {
    public typealias Delegate = ARSessionDelegate
}

open class RxARSessionDelegateProxy: RxARSessionDelegate, DelegateProxyType, ARSessionDelegate {
    
    /// Type of parent object
    public weak private(set) var session: ARSession?
    
    /// Init with ParentObject
    public init(parentObject: ParentObject) {
        session = parentObject
        super.init(parentObject: parentObject, delegateProxy: RxARSessionDelegateProxy.self)
    }
    
    /// Register self to known implementations
    public static func registerKnownImplementations() {
        self.register { parent -> RxARSessionDelegateProxy in
            RxARSessionDelegateProxy(parentObject: parent)
        }
    }
    
    /// Gets the current `ARSessionDelegate` on `ARSession`
    open class func currentDelegate(for object: ParentObject) -> ARSessionDelegate? {
        return object.delegate
    }
    
    /// Set the `ARSessionDelegate` for `ARSession`
    open class func setCurrentDelegate(_ delegate: ARSessionDelegate?, to object: ParentObject) {
        object.delegate = delegate
    }
}
