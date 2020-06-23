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
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
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
    
//    path.move(to: CGPoint(x: 0.0, y: 0.0))
//    
//    path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
//    path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
//    //path.addLine(to: CGPoint(x: self.frame.size.width, y: 0.0))
//    path.addArc(withCenter: CGPoint(x: self.frame.size.width, y: 0.0),
//                radius: self.frame.size.height,
//                startAngle: -.pi/2,
//                endAngle: .pi/2,
//                clockwise: true)
    
//    path.addArc(withCenter: CGPoint(x: 180, y: 20), radius: 15, startAngle: -.pi/2, endAngle: .pi/2, clockwise: true)
//    path.addLine(to: CGPoint(x: 10, y: 35))
//    path.addArc(withCenter: CGPoint(x: 10, y: 20), radius: 15, startAngle: .pi/2, endAngle:-.pi/2 , clockwise: true)
    
    //path.close()
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
    
    UIColor.clear.setStroke()
    path.stroke()
  }
}
