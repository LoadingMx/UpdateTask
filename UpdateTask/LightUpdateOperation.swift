//
//  LightUpdateOperation.swift
//  Operation&OperationQueue
//
//  Created by Mx on 3/3/22.
//  Copyright © 2022 pro648. All rights reserved.
//

import UIKit

class LightUpdateOperation: AsyncOperation {

    var index: Int
    
    var data: LightUpdateModel?
    
    init(index: Int) {
        self.index = index
        super.init()
    }
    
    override func main() {
        
//        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + 3) { [weak self] in
//            
//            guard let self = self else { return }
//            
//            defer {
//                self.state = .finished
//            }
//            self.data = LightUpdateModel(index: self.index, data: "time")
//        }
        
    }
    
    
    func update(data: LightUpdateModel) {
        
        self.state = .finished
        
        self.data = data
    }
}
