//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 31.05.2020.
//

import Foundation

public class LThrottler {

    private var workItem: DispatchWorkItem?
    private let queue: DispatchQueue
    private let delay: TimeInterval

    public init(delay: TimeInterval, queue: DispatchQueue = DispatchQueue.main) {
        self.delay = delay
        self.queue = queue
    }

    public func throttle(_ block: @escaping () -> Void) {
        // Cancel any existing work item if it has not yet executed
        self.workItem?.cancel()

        // Re-assign workItem with the new block task, resetting the previousRun time when it executes
        let workItem = DispatchWorkItem {
            block()
        }

        queue.asyncAfter(deadline: .now() + Double(delay), execute: workItem)
        
        self.workItem = workItem
    }
    
    public func cancel() {
        self.workItem?.cancel()
    }
}
