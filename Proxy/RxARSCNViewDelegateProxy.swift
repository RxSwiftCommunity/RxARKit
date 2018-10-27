//
//  RxARSCNViewDelegateProxy.swift
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

extension ARSCNView: HasDelegate {
    public typealias Delegate = ARSCNViewDelegate
}

open class RxARSCNViewDelegateProxy
    : DelegateProxy<ARSCNView, ARSCNViewDelegate>
    , DelegateProxyType
, ARSCNViewDelegate {
    
    /// Typed parent object.
    public weak private(set) var view: ARSCNView?
    
    /// - parameter view: Parent object for delegate proxy.
    public init(view: ParentObject) {
        self.view = view
        super.init(parentObject: view, delegateProxy: RxARSCNViewDelegateProxy.self)
    }
    
    // Register known implementationss
    public static func registerKnownImplementations() {
        self.register { RxARSCNViewDelegateProxy(view: $0) }
    }
}

