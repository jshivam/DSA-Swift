//
//  WordLadder.swift
//  DSA
//
//  Created by Shivam Jaiswal on 20/09/19.
//  Copyright © 2019 Shivam Jaiswal. All rights reserved.
//

import UIKit

class WordLadder: Executable {
    func excecute() {
        let beginWord = "hit"
        let endWord = "cog"
        let wordList = ["hot","dot","dog","lot","log","cog"]
        let output = ladderLength(beginWord, endWord, wordList)
        print(output)
    }
    
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int
    {
        if ((beginWord == endWord) || (!wordList.contains(endWord))){
            return 0
        }
        
        var dictionary = wordList
        let Q = Queue<String>()
        Q.enqueue(beginWord)
        
        var count = 0
        while !Q.isEmpty
        {
            let size = Q.size
            
            for _ in 0..<size
            {
                let word = Q.dequeue()!
                
                if word == endWord {
                    return count + 1
                }
                
                for index in 0..<word.count
                {
                    var array = Array(word).map({String($0)})
                    
                    for char in "abcdefghijklmnopqrstuvwxyz"
                    {
                        array[index] = String(char)
                        let newWord = array.joined()
                        if dictionary.contains(newWord) && (newWord != word) {
                            dictionary.removeAll { $0 == newWord }
                            Q.enqueue(newWord)
                        }
                    }
                }
            }
            count += 1
        }
        return 0
    }
}

