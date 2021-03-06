//
//  Mean.swift
//
//  Created by Ahmad El-khawaldeh
//  Created on 2020-01-01
//  Version 1.0
//  Copyright (c) 2020 MTHS. All rights reserved.
//
//  The "Statistics" program it gives the mean and the medain 
//

import Foundation

func mean(arrayOfIntegers: [Int]) throws -> Double {
    // this is the mean function.
    let size: Int = arrayOfIntegers.count
    var total = 0
    for counter in arrayOfIntegers {
        total += counter
    }
    let meanValue: Double = Double(total) / Double(size)
    return meanValue
}

func median(arrayOfIntegers: [Int]) throws -> Double {
    // this is the median function.
    var returnValue: Double
    var array = arrayOfIntegers
    array.sort()
    let numberOfNumbers = array.count
    if numberOfNumbers % 2 == 0 {
        let numberOfMedian1 = (numberOfNumbers / 2) - 1
        let median1: Int = array[numberOfMedian1]
        let numberOfMedian2 = numberOfNumbers / 2
        let median2: Int = array[numberOfMedian2]
        returnValue = Double(median1 + median2) / 2
    } else {
        let numberOfMedian = Int((Double(numberOfNumbers) / 2) + 0.5)
        returnValue = Double(array[numberOfMedian])
    }
        return returnValue

}

let input = CommandLine.arguments
let file = input[1]
var array: [String] = []
var arrayInt: [Int] = []
// FileManager is the way to write and read files in swift
if let dir = FileManager.default.urls(for: .documentDirectory,
                                      in: .userDomainMask).first {
    let fileURL = dir.appendingPathComponent(file)
    do {
        let text = try String(contentsOf: fileURL, encoding: .utf8)
        array = text.components(separatedBy: .newlines)
    } catch {print("error")}
} else { print("error2") }

for counter in array where !counter.isEmpty {
    arrayInt.append(Int(counter)!)
}
print(arrayInt)

print("\nCalculating stats...")
let meanPrint = try mean(arrayOfIntegers: arrayInt)
let medianPrint = try median(arrayOfIntegers: arrayInt)

print("The mean is: \(meanPrint)")
print("The median is: \(medianPrint)")

print("\nDone.\n")
