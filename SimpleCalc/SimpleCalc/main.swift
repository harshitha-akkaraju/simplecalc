//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        if args[args.count - 1] == "count" || args[args.count - 1] == "avg" || args[args.count - 1] == "fact" {
            return function(args)
        }
        return arithmetic(args)
    }
    
    public func arithmetic(_ args: [String]) -> Int {
        if args[1] == "+" {
            return Int(args[0])! + Int(args[2])! // these are of type string. Convert to int.
        } else if args[1] == "-" {
            return Int(args[0])! - Int(args[2])!
        } else if args[1] == "*" {
            return Int(args[0])! * Int(args[2])!
        } else if args[1] == "/" {
            return Int(args[0])! / Int(args[2])!
        }
        return Int(args[0])! % Int(args[2])!
    }
    
    public func function(_ args: [String]) -> Int {
        if args[args.count - 1] == "count" {
            return args.count - 1
        } else if args[args.count - 1] == "avg" {
            var result = 0
            for i in args {
                if i != "avg" {
                    result += Int(i)!
                }
            }
            if (args.count - 1 > 0) {
                return result / (args.count - 1)
            } else {
                return 0
            }
        }
        if args[0] == "fact" {
            return 0
        } else if args[1] == "0" {
            return 1
        }
        let n = Int(args[0])!
        var result = 1
        for i in 1...n {
            result *= i
        }
        return result
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

