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
        print(Solution.init().snakesAndLadders(
            [[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,35,-1,-1,13,-1],[-1,-1,-1,-1,-1,-1],[-1,15,-1,-1,-1,-1]]
        ))
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
