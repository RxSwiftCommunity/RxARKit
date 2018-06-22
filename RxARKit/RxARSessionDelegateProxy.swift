//
//  RxARSessionDelegateProxy.swift
//  RxARKit
//
//  Created by Maxim Volgin on 22/06/2018.
//  Copyright © 2018 Maxim Volgin. All rights reserved.
//

import ARKit
import RxSwift
import RxCocoa

extension ARSession: HasDelegate {
    public typealias Delegate = ARSessionDelegate
}

open class RxARSessionDelegateProxy
    : DelegateProxy<ARSession, ARSessionDelegate>
    , DelegateProxyType
, ARSessionDelegate {
    
    /// Typed parent object.
    public weak private(set) var session: ARSession?
    
    /// - parameter session: Parent object for delegate proxy.
    public init(session: ParentObject) {
        self.session = session
        super.init(parentObject: session, delegateProxy: RxARSessionDelegateProxy.self)
    }
    
    // Register known implementationss
    public static func registerKnownImplementations() {
        self.register { RxARSessionDelegateProxy(session: $0) }
    }
}
