//
//  MacawChartView.swift
//  DemoCharts
//
//  Created by nghiadang1205 on 3/30/20.
//  Copyright © 2020 NghiaDang. All rights reserved.
//

import Foundation
import Macaw

class MacawChartView: MacawView {
    static let lastFiveShows = createDummyData()
    static let maxValue = 6000
    static let maxValueLineHeight = 180  // 180
    static let lineWidth: Double = 275
    
    static let dataDivisor = Double(maxValue/maxValueLineHeight)
    static let adjustedData: [Double] = lastFiveShows.map({ $0.viewCount / dataDivisor })
    static var animations: [Animation] = []
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(node: MacawChartView.createChart(), coder: aDecoder)
        backgroundColor = .clear
    }
    
    private static func createChart() -> Group {
        print(dataDivisor)
        print(adjustedData)
        var items: [Node] = addYAxisItems() + addXAxisItems()
        items.append(createBars())
        return Group(contents: items, place: .identity)
    }
    
    private static func addYAxisItems() -> [Node] {
        let maxLines            = 6
        let lineInterval        = Int(maxValue/maxLines)
        let yAxisHeight: Double = 200
        let lineSpacing: Double = 30
        
        var newNodes: [Node]    = []
        
        for i in 1...maxLines {
            let y = yAxisHeight - (Double(i) * lineSpacing)
            
            let valueLine = Line(x1: -5, y1: y, x2: lineWidth, y2: y).stroke(fill: Color.white.with(a: 0.20))
            let valueText = Text(text: "\(i * lineInterval)", align: .max, baseline: .mid, place: .move(dx: -10, dy: y))
            valueText.fill = Color.red
            
            newNodes.append(valueLine)
            newNodes.append(valueText)
        }
        
        let yAxis = Line(x1: 0, y1: 0, x2: 0, y2: yAxisHeight).stroke(fill: Color.red.with(a: 0.40))
        newNodes.append(yAxis)
        
        return newNodes
    }
    
    private static func addXAxisItems() -> [Node] {
        let chartBaseY: Double = 200  // = yAxisHeight
        var newNodes: [Node] = []
        
        for i in 1...adjustedData.count {
            let x = (Double(i) * 50)
            let valueText = Text(text: lastFiveShows[i - 1].showNumber, align: .max, baseline: .mid, place: .move(dx: x, dy: chartBaseY + 15))
            valueText.fill = Color.blue
            newNodes.append(valueText)
        }
        
        let xAxis = Line(x1: 0, y1: chartBaseY, x2: lineWidth, y2: chartBaseY).stroke(fill: Color.white.with(a: 0.40))
        newNodes.append(xAxis)
        
//        let zzAxis = Line(x1: 0, y1: 100, x2: lineWidth, y2: 100).stroke(fill: Color.green.with(a: 1.0))
//        newNodes.append(zzAxis)
        
        return newNodes
    }
    
    private static func createBars() -> Group {
        let fill = LinearGradient(degree: 90, from: Color(val: 0xff4704), to: Color(val: 0xff4704).with(a: 0.33))
        let items = adjustedData.map({ _ in Group() })
        
        animations = items.enumerated().map {(i: Int, item: Group) in
            item.contentsVar.animation(delay: Double(i) * 0.1) { t in
                let height = adjustedData[i] * t
                let rect = Rect(x: Double(i) * 50 + 25, y: 200 - height, w: 30, h: height)
                return [rect.fill(with: fill)]
            }
        }
        
        return items.group()
    }
    
    static func playAnimations() {
        animations.combine().play()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    private static func createDummyData() -> [SwiftNewsVideo] {
        let one     = SwiftNewsVideo(showNumber: "T2", viewCount: 3456)
        let two     = SwiftNewsVideo(showNumber: "T3", viewCount: 5200)
        let three   = SwiftNewsVideo(showNumber: "T4", viewCount: 4250)
        let four    = SwiftNewsVideo(showNumber: "T5", viewCount: 3688)
        let five    = SwiftNewsVideo(showNumber: "T6", viewCount: 4823)
        let six    = SwiftNewsVideo(showNumber: "T7", viewCount: 4823)
        let seven    = SwiftNewsVideo(showNumber: "CN", viewCount: 4823)
        
        return [one, two, three, four, five, six, seven]
//        return [one, two, three, four, five]
    }
}
