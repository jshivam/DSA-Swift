//
//  Longest Palindromic Substring.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 21/06/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit
/**
 Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.

 Example 1:

     Input: "babad"
     Output: "bab"

     Note: "aba" is also a valid answer.

 Example 2:

     Input: "cbbd"
     Output: "bb"
*/
class Longest_Palindromic_Substring: Executable {
    func excecute() {
        print(NSDate())

        print(longestPalindrome("lphbehiapswjudnbcossedgioawodnwdruaaxhbkwrxyzaxygmnjgwysafuqbmtzwdkihbwkrjefrsgjbrycembzzlwhxneiijgzidhngbmxwkhphoctpilgooitqbpjxhwrekiqupmlcvawaiposqttsdgzcsjqrmlgyvkkipfigttahljdhtksrozehkzgshekeaxezrswvtinyouomqybqsrtegwwqhqivgnyehpzrhgzckpnnpvajqevbzeksvbezoqygjtdouecnhpjibmsgmcqcgxwzlzztdneahixxhwwuehfsiqghgeunpxgvavqbqrelnvhnnyqnjqfysfltclzeoaletjfzskzvcdwhlbmwbdkxnyqappjzwlowslwcbbmcxoiqkjaqqwvkybimebapkorhfdzntodhpbhgmsspgkbetmgkqlolsltpulgsmyapgjeswazvhxedqsypejwuzlvegtusjcsoenrcmypexkjxyduohlvkhwbrtzjnarusbouwamazzejhnetfqbidalfomecehfmzqkhndpkxinzkpxvhwargbwvaeqbzdhxzmmeeozxxtzpylohvdwoqocvutcelgdsnmubyeeeufdaoznxpvdiwnkjliqtgcmvhilndcdelpnilszzerdcuokyhcxjuedjielvngarsgxkemvhlzuprywlypxeezaxoqfges"))
        print(NSDate())
    }

    func longestPalindrome(_ s: String) -> String {
        let array = Array(s)
        guard !array.isEmpty else { return s }
        var hashMap = [Key : ClosedRange<Int>]()
        let range = longestPalindromeHelper(Array(s), start: 0, end: array.count - 1, hashMap: &hashMap)
        return String(array[range])
    }

    func longestPalindromeHelper(_ s: [Character],
                                 start: Int,
                                 end: Int,
                                 hashMap: inout [Key : ClosedRange<Int>]) ->  ClosedRange<Int> {

        let key = Key(start: start, end: end)
        if let value = hashMap[key] { return value }

        var start = start
        var end = end
        var current = 0...0

        if start >= end {
            start = min(start, end)
            hashMap[key] = start...start
            return start...start
        }


        let prevStart = start
        let prevEnd = end
        while s[start] == s[end] && start < end {
            start += 1
            end -= 1
        }

        if start >= end {
            current = prevStart...prevEnd
        }

        let goRight = longestPalindromeHelper(s, start: prevStart + 1, end: prevEnd, hashMap: &hashMap)
        let goLeft = longestPalindromeHelper(s, start: prevStart, end: prevEnd - 1, hashMap: &hashMap)

        let result = max(current, max(goLeft, goRight))
        hashMap[key] = result

        return result
    }

    struct Key: Hashable {
        let start: Int
        let end: Int
    }
}

extension ClosedRange: Comparable where Bound == Int {
    public static func < (lhs: ClosedRange<Bound>, rhs: ClosedRange<Bound>) -> Bool {
        return lhs.count < rhs.count
    }

    public static func == (lhs: ClosedRange<Bound>, rhs: ClosedRange<Bound>) -> Bool {
        return lhs.count == rhs.count
    }
}
