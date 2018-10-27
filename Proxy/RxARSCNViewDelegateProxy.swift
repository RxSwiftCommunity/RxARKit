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

public typealias RxARSCNViewDelegate = DelegateProxy<ARSCNView, ARSCNViewDelegate>

extension ARSCNView: HasDelegate {
    public typealias Delegate = ARSCNViewDelegate
}

open class RxARSCNViewDelegateProxy: RxARSCNViewDelegate, DelegateProxyType, ARSCNViewDelegate {
    
    /// Type of parent object
    public weak private(set) var view: ARSCNView?
    
    /// Init with ParentObject
    public init(parentObject: ParentObject) {
        view = parentObject
        super.init(parentObject: parentObject, delegateProxy: RxARSCNViewDelegateProxy.self)
    }
    
    /// Register self to known implementations
    public static func registerKnownImplementations() {
        self.register { parent -> RxARSCNViewDelegateProxy in
            RxARSCNViewDelegateProxy(parentObject: parent)
        }
    }
    
    /// Gets the current `ARSCNViewDelegate` on `ARSCNView`
    open class func currentDelegate(for object: ParentObject) -> ARSCNViewDelegate? {
        return object.delegate
    }
    
    /// Set the `ARSCNViewDelegate` for `ARSCNView`
    open class func setCurrentDelegate(_ delegate: ARSCNViewDelegate?, to object: ParentObject) {
        object.delegate = delegate
    }
}

