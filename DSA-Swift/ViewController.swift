//
//  ViewController.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 02/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let c = Codec()
        
        print(c.encode("https://chatgpt.com/c/81aa3930-9112-4d93-af04-977335da1204"))
        print(c.encode("https://chatgpt.com/c/81aa3930-9112-4d93-af04-977335da1203"))
        print(c.encode("https://chatgpt.com/c/81aa3930-9112-4d93-af04-977335da1201"))
        print(c.encode("https://chatgpt.com/c/81aa3930-9112-4d93-af04-977335da1200"))
        
        
    }
}

class Codec {
    let chars = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var map = [String: String]()
    var count = 100

    func getString() -> String {
        var c = count
        var sb = ""
        while c > 0 {
            c -= 1
            sb.append(chars[chars.index(chars.startIndex, offsetBy: c % 62)])
            c /= 62
        }
        return String(sb.reversed())
    }

    func encode(_ longUrl: String) -> String {
        let key = getString()
        map[key] = longUrl
        count += 1
        return "http://tinyurl.com/\(key)"
    }

    func decode(_ shortUrl: String) -> String? {
        let key = shortUrl.replacingOccurrences(of: "http://tinyurl.com/", with: "")
        return map[key]
    }
}
