# RxARKit
RxARKit (based on RxSwift)

Basic usage.

```swift

session
    .rx
    .didUpdateFrame
    .subscribe { event in
        switch event {
        case .next(let didUpdateFrame):
        let frame: ARFrame = didUpdateFrame.frame
            break
        default:
            break
        }
    }
    .disposed(by: disposeBag)
    
session
    .rx
    .cameraDidChangeTrackingState
    .subscribe { event in
    switch event {
        case .next(let cameraDidChangeTrackingState):
        let camera: ARCamera = cameraDidChangeTrackingState.camera
            break
        default:
            break
        }
    }
    .disposed(by: disposeBag)
    
skView.rx.nodeForAnchor = { (view, anchor) -> SKNode? in
    let node: SKNode? = nil
    // TODO: create node
    return node
}

scnView.rx.nodeForAnchor = { (sceneRenderer, anchor) -> SCNNode? in
    let node: SCNNode? = nil
    // TODO: create node
    return node
}

```

Carthage setup.

```
github "maxvol/RxARKit" ~> 0.0.3

```

