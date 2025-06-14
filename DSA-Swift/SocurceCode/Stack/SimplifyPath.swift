//
//  SimplifyPath.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 14/06/25.
//  Copyright © 2025 Shivam Jaiswal. All rights reserved.
//

import Foundation

class SimplifyPath: Executable {
    func excecute() {
        print(simplifyPath("/home/user/Documents/../Pictures"))
        print(simplifyPath("/home/"))
        print(simplifyPath("/.../a/../b/c/../d/./"))

    }
    
    func simplifyPath(_ path: String) -> String {
        var stack: [String.SubSequence] = []
        
        let components = path.split(separator: "/")
        
        for component in components {
            if isValidDirectory(component) {
                stack.append(component)
            }
            else if isPreviousDirectory(component) {
                if !stack.isEmpty {
                    stack.removeLast()
                }
            }
        }
        
        var result = stack.joined(separator: "/")
        result = "/" + result
        return result
    }
    
    func isValidDirectory(_ component: String.SubSequence) -> Bool {
        if component.isEmpty || component == "." || component == ".." {
            return false
        }
        
        return true
    }
    
    func isPreviousDirectory(_ component: String.SubSequence) -> Bool {
        return component == ".."
    }
}
