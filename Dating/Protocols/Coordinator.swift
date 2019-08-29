//
//  Coordinator.swift
//  loc
//
//  Created by oleygen ua on 1/22/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

private var unsafe_associatedObject: Array<Coordinator> = []

typealias CoordinatorCompletionBlock = () -> Void

protocol Coordinator: class {
    func start()
    func start(with deeplinkOption: DeepLinkOption?)    
}

extension Coordinator {
    
    var children: Array<Coordinator> {
        get {
            guard let array = objc_getAssociatedObject(self, &unsafe_associatedObject) as? Array<Coordinator> else {
                objc_setAssociatedObject(self, &unsafe_associatedObject, Array<Coordinator>(), .OBJC_ASSOCIATION_RETAIN)
                return objc_getAssociatedObject(self, &unsafe_associatedObject) as! Array<Coordinator>
            }
            return array
        }
        set {
            objc_setAssociatedObject(self, &unsafe_associatedObject, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    /* only unique objects should be added */
    func addDependency(_ coordinator: Coordinator) {
        guard !children.contains(where: {  $0 === coordinator }) else { return }
        children.append(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinator?) {
        guard children.isEmpty == false,
            let coordinator = coordinator
            else { return }
        
        for (index, child) in children.enumerated() {
            if child === coordinator {
                children.remove(at: index)
                break
            }
        }
    }
}
