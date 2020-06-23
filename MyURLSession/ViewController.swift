//
//  ViewController.swift
//  MyURLSession
//
//  Created by Даниил Максимчик on 6/5/20.
//  Copyright © 2020 Даниил Максимчик. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
        
    let myModel: RequestModel = RequestModel()
    
    myModel.register() { (registerData) in
      myModel.registerData = registerData
      print(myModel.registerData.accessToken)
      print(myModel.registerData.tokenType)
      print(myModel.registerData.expiresIn)
      
      myModel.get() { (data) in
        myModel.mainData = data
        
        myModel.mainData.data.sort {
          if $0.validFrom != $1.validFrom {
              return $0.validFrom < $1.validFrom
          } else {
            return $0.validFrom < $1.validFrom
          }
        }
        
        for temp in myModel.mainData.data {
          print("Buy: \(temp.validFrom)")
          print("Buy: \(temp.rate.buyRate)")
          print("Sell: \(temp.rate.sellRate)\n")
        }
      }
    }
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    let width: CGFloat = 10000 //375 for iphone 6s
    let height: CGFloat = 667 //self.view.frame.size.heigh
    
    let startX: CGFloat = 0
    let startY: CGFloat = 50

    let demoView = DemoView(frame: CGRect(x: startX,
                                            y:  startY,
                                            width: width,
                                            height: height - 100))
    
    let scrollView = UIScrollView()
    scrollView.contentSize = demoView.frame.size
    scrollView.addSubview(demoView)
    scrollView.flashScrollIndicators()
    scrollView.backgroundColor = .blue
    self.view = scrollView
    
    self.view.addSubview(demoView)
 }
}

