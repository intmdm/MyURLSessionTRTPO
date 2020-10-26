//
//  DemoView.swift
//  Charts
//
//  Created by Даниил Максимчик on 6/1/20.
//  Copyright © 2020 Даниил Максимчик. All rights reserved.
//

import UIKit

class DemoView: UIView {

  var path: UIBezierPath!
  var columSize: CGFloat = 30
  
  var data: RequestModel = RequestModel()
    
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.backgroundColor = .red
  }
  
  init(frame: CGRect, data: RequestModel) {
    super.init(frame: frame)
    self.data = data
    self.backgroundColor = .red
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  func createRectangle() {
    
    var redFlag = -1
    path = UIBezierPath()
                
    for temp in stride(from: 0, to: Int(self.frame.size.width), by: Int(columSize) * 2) {
      let x: CGFloat = CGFloat(temp)
      
      redFlag += 1
      path = UIBezierPath()
      path.move(to: CGPoint(x: x, y: 0))
      path.addLine(to: CGPoint(x: x, y: self.frame.size.height))
      path.addLine(to: CGPoint(x: x + columSize, y: self.frame.size.height))
      checkFlag(flag: redFlag)
      path.addLine(to: CGPoint(x: x + columSize, y: 0))
      UIColor.clear.setStroke()
      path.stroke()
      path.close()
      UIColor.gray.setFill()
      path.fill()
      
      redFlag += 1
      path = UIBezierPath()
      path.move(to: CGPoint(x: x + columSize, y: 0))
      path.addLine(to: CGPoint(x: x + columSize, y: self.frame.size.height))
      path.addLine(to: CGPoint(x: x + columSize * 2, y: self.frame.size.height))
      checkFlag(flag: redFlag)
      path.addLine(to: CGPoint(x: x + columSize * 2, y: 0))
      UIColor.clear.setStroke()
      path.stroke()
      path.close()
      UIColor.white.setFill()
      path.fill()
    }
  }
  
  func creatGraph() {
    let aPath = UIBezierPath()
    aPath.move(to: CGPoint(x:0, y:0))
    aPath.addLine(to: CGPoint(x: 100, y: 100))
    aPath.close()
    
    UIColor.red.set()
    aPath.lineWidth = CGFloat()
    aPath.stroke()
    
    print("Data: \(data.mainData.data[0].validFrom)")
    print("Buy: \(data.mainData.data[0].rate.buyRate)")
    print("Sell: \(data.mainData.data[0].rate.sellRate)\n")
}
  
  func checkFlag(flag: Int) {
    if flag % 5 == 0 {
      path.lineWidth = 5
      UIColor.red.setStroke()
      path.stroke()
    }
  }
  
  override func draw(_ rect: CGRect) {
    
    self.createRectangle()
    self.creatGraph()
    
    UIColor.clear.setStroke()
    path.stroke()
  }
}
