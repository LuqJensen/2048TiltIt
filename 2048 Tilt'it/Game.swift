//
//  Game.swift
//  2048 Tilt'it
//
//  Created by Thanusaan Rasiah on 13/11/2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation

class Game {
    
    var matrix: [[Int]]
    var size = 4
    var score = 0
    
    private func getEmptyPoints() -> [Point] {
        var emptyPoints : [Point] = []
        for y in 0..<size {
            for x in 0..<size {
                if matrix[y][x] == 0 {
                    emptyPoints.append(Point(x: x, y: y))
                }
            }
        }
        return emptyPoints
    }
    
    init() {
        matrix = []
        for _ in 0..<size {
            var row: [Int] = []
            for _ in 0..<size {
                row.append(0)
            }
            matrix.append(row)
        }
        
        addTile()
        addTile()
        printState()
        
    }
    
    private func addTile() {
        let emptyPoints = getEmptyPoints()
        let point = emptyPoints[Int(arc4random_uniform(UInt32(emptyPoints.count)))]
        matrix[point.y][point.x] = 2
    }
    
    private func printState() {
        for y in 0..<size {
            for x in 0..<size {
                print("\(matrix[y][x])  ", terminator: "")
            }
            print("")
        }
        print("")
        print("Score: \(score)")
    }
    
    public func moveLeft() {
        var didMove = false
        for y in 0..<size {
            var matchingValue = -1
            var matchingFieldXpos = -1
            for x in 0..<size {
                let value = matrix[y][x]
                if value != 0 {
                    var firstEmptyTile = -1
                    var beforeX = false
                    var beforeMatchingX = true
                    for index in 0..<size {
                        if index == x {
                            break
                        } else if index == matchingFieldXpos {
                            beforeMatchingX = false
                        }
                        let value = matrix[y][index]
                        if value == 0 {
                            firstEmptyTile = index
                            beforeX = true
                            break
                        }
                    }
                    if value == matchingValue {
                        matrix[y][x] = 0
                        if beforeMatchingX {
                            matrix[y][matchingFieldXpos] = 0
                            matrix[y][firstEmptyTile] = value*2
                        } else {
                            matrix[y][matchingFieldXpos] = value*2
                        }
                        matchingValue = -1
                        matchingFieldXpos = -1
                        score += value*2
                        didMove = true
                    } else if beforeX {
                        matrix[y][x] = 0
                        matrix[y][firstEmptyTile] = value
                        matchingValue = value
                        matchingFieldXpos = firstEmptyTile
                        didMove = true
                    } else {
                        matchingValue = value
                        matchingFieldXpos = x
                    }
                }
            }
        }
        if didMove {
            addTile()
            printState()
        }
    }
    
    public func moveRight() {
        var didMove = false
        for y in 0..<size {
            var matchingValue = -1
            var matchingFieldXpos = -1
            for x in (0..<size).reversed() {
                let value = matrix[y][x]
                if value != 0 {
                    var firstEmptyTile = -1
                    var beforeX = false
                    var beforeMatchingX = true
                    for index in (0..<size).reversed() {
                        if index == x {
                            break
                        } else if index == matchingFieldXpos {
                            beforeMatchingX = false
                        }
                        let value = matrix[y][index]
                        if value == 0 {
                            firstEmptyTile = index
                            beforeX = true
                            break
                        }
                    }
                    if value == matchingValue {
                        matrix[y][x] = 0
                        if beforeMatchingX {
                            matrix[y][matchingFieldXpos] = 0
                            matrix[y][firstEmptyTile] = value*2
                        } else {
                            matrix[y][matchingFieldXpos] = value*2
                        }
                        matchingValue = -1
                        matchingFieldXpos = -1
                        score += value*2
                        didMove = true
                    } else if beforeX {
                        matrix[y][x] = 0
                        matrix[y][firstEmptyTile] = value
                        matchingValue = value
                        matchingFieldXpos = firstEmptyTile
                        didMove = true
                    } else {
                        matchingValue = value
                        matchingFieldXpos = x
                    }
                }
            }
        }
        if didMove {
            addTile()
            printState()
        }
    }
    
    public func moveUp() {
        var didMove = false
        for x in 0..<size {
            var matchingValue = -1
            var matchingFieldXpos = -1
            for y in 0..<size {
                let value = matrix[y][x]
                if value != 0 {
                    var firstEmptyTile = -1
                    var beforeX = false
                    var beforeMatchingX = true
                    for index in 0..<size {
                        if index == y {
                            break
                        } else if index == matchingFieldXpos {
                            beforeMatchingX = false
                        }
                        let value = matrix[index][x]
                        if value == 0 {
                            firstEmptyTile = index
                            beforeX = true
                            break
                        }
                    }
                    if value == matchingValue {
                        matrix[y][x] = 0
                        if beforeMatchingX {
                            matrix[matchingFieldXpos][x] = 0
                            matrix[firstEmptyTile][x] = value*2
                        } else {
                            matrix[matchingFieldXpos][x] = value*2
                        }
                        matchingValue = -1
                        matchingFieldXpos = -1
                        score += value*2
                        didMove = true
                    } else if beforeX {
                        matrix[y][x] = 0
                        matrix[firstEmptyTile][x] = value
                        matchingValue = value
                        matchingFieldXpos = firstEmptyTile
                        didMove = true
                    } else {
                        matchingValue = value
                        matchingFieldXpos = y
                    }
                }
            }
        }
        if didMove {
            addTile()
            printState()
        }
    }
    
    public func moveDown() {
        var didMove = false
        for x in 0..<size {
            var matchingValue = -1
            var matchingFieldXpos = -1
            for y in (0..<size).reversed() {
                let value = matrix[y][x]
                if value != 0 {
                    var firstEmptyTile = -1
                    var beforeX = false
                    var beforeMatchingX = true
                    for index in (0..<size).reversed() {
                        if index == y {
                            break
                        } else if index == matchingFieldXpos {
                            beforeMatchingX = false
                        }
                        let value = matrix[index][x]
                        if value == 0 {
                            firstEmptyTile = index
                            beforeX = true
                            break
                        }
                    }
                    if value == matchingValue {
                        matrix[y][x] = 0
                        if beforeMatchingX {
                            matrix[matchingFieldXpos][x] = 0
                            matrix[firstEmptyTile][x] = value*2
                        } else {
                            matrix[matchingFieldXpos][x] = value*2
                        }
                        matchingValue = -1
                        matchingFieldXpos = -1
                        score += value*2
                        didMove = true
                    } else if beforeX {
                        matrix[y][x] = 0
                        matrix[firstEmptyTile][x] = value
                        matchingValue = value
                        matchingFieldXpos = firstEmptyTile
                        didMove = true
                    } else {
                        matchingValue = value
                        matchingFieldXpos = y
                    }
                }
            }
        }
        if didMove {
            addTile()
            printState()
        }
    }
}

struct Point {
    var x = 0
    var y = 0
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}
