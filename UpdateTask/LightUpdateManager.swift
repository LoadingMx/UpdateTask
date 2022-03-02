//
//  LightUpdateManager.swift
//  Operation&OperationQueue
//
//  Created by Mx on 3/3/22.
//  Copyright © 2022 pro648. All rights reserved.
//

import UIKit

struct LightUpdateModel {
    var index: Int
    var data: String
}

class LightUpdateManager: NSObject {
    
    static let shared = LightUpdateManager()
    
    var tasks = [LightUpdateOperation]()
    
    lazy var lightQueue: OperationQueue = {
        let lightQueue = OperationQueue()
        lightQueue.maxConcurrentOperationCount = 2
        return lightQueue
    }()
    
    func start() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(newLight(_:)), name: NSNotification.Name(rawValue: "light"), object: nil)
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            
            for i in 0..<5 {
                let task = LightUpdateOperation(index: i)
                task.completionBlock = {
                    debugPrint("task done", task.index)
                }
                self.tasks.append(task)
            }
            
            self.lightQueue.addOperations(self.tasks, waitUntilFinished: true)
            
            debugPrint("Done")
            
        }
    }
    
    @objc func newLight(_ noti: Notification) {
        guard let model = noti.object as? LightUpdateModel else { return }
        debugPrint("New", "\(model.index)")
        
        let task = tasks.first { $0.index == model.index }
        task?.update(data: model)
        
        
    }

}
