//
//  RequestModel.swift
//  MyURLSession
//
//  Created by Даниил Максимчик on 6/5/20.
//  Copyright © 2020 Даниил Максимчик. All rights reserved.
//

import UIKit

struct PostRequestModel: Codable {
  var accessToken: String = ""
  var tokenType: String = ""
  var expiresIn: Int = 0
}

struct PostRequestModel2: Codable {
  var dateFrom: String
  var dateTo: String
  var channels: String
  var bankUnits: Int
  var baseCurrencies: String
  var ratedCurrencies: String
  var count: Int
}

class RequestModel {
    
  var registerData: PostRequestModel = PostRequestModel()
  var mainData: PriorCurrencyResponse = PriorCurrencyResponse(data: [CurrencyRate(validFrom: "", rate: ExchangeRate(sellRate: 0, buyRate: 0))])
  
  var postRequestModel2: PostRequestModel2 = PostRequestModel2(dateFrom: "2020-06-10%2009:00:00",
                                                               dateTo: "2020-06-12%2021:00:00",
                                                               channels: "1",
                                                               bankUnits: 0,
                                                               baseCurrencies: "840,%20933",
                                                               ratedCurrencies: "840,%20933",
                                                               count: 10)
  
  func show() {
    print(self.registerData.accessToken)
  }
  
  func get(result: @escaping ((PriorCurrencyResponse) -> Void)) {
        
    let url = URL(string: "https://api.priorbank.by:9344/currency/v2/prior/rate-changes?dateFrom=\(postRequestModel2.dateFrom)&dateTo=\(postRequestModel2.dateTo)&channels=\(postRequestModel2.channels)&bankUnits=\(postRequestModel2.bankUnits)&baseCurrencies=\(postRequestModel2.baseCurrencies)&count=\(postRequestModel2.count)&baseCurrencies=\(postRequestModel2.baseCurrencies)&ratedCurrencies=\(postRequestModel2.ratedCurrencies)")
    
   guard let requestUrl = url else { fatalError() }

   var request = URLRequest(url: requestUrl)
   request.httpMethod = "GET"
   request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Accept")
   print("Autoriz: \(registerData.tokenType) \(registerData.accessToken)")
   request.setValue("\(registerData.tokenType) \(registerData.accessToken)", forHTTPHeaderField: "Authorization")

    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

       if let error = error {
           print("\nError took place 2 \(error)")
           return
       }
 
      if let data = data, let dataString = String(data: data, encoding: .utf8) {
          print("\nResponse data string:\n \(dataString)")
      }
           
       guard let data = data else {return}

       do{
            let todoItemModel = try JSONDecoder().decode(PriorCurrencyResponse.self, from: data)
            result(todoItemModel)

        }catch let jsonErr{
            print("\njsonErr2\n")
            print(jsonErr)
     }
     }
     task.resume()
  }

  
  func register(result: @escaping ((PostRequestModel) -> Void)) {
        
    let url = URL(string: "https://api.priorbank.by:9344/authorize/v2/oauth2/clientCredentials/token")
    guard let requestUrl = url else { fatalError() }

    var request = URLRequest(url: requestUrl)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    let postString = "clientID=KfskUr24p7lBxbWDvpyIZlH8xgka&clientSecret=sfFMlkNF6ndS7MYehrKeNkBLjK8a"
    request.httpBody = postString.data(using: String.Encoding.utf8)

    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

        if let error = error {
            print("Error took place 1 \(error)")
            return
        }
            
        guard let data = data else {return}

        do{
             let todoItemModel = try JSONDecoder().decode(PostRequestModel.self, from: data)
             result(todoItemModel)

         }catch let jsonErr{
             print("jsonErr1\n")
             print(jsonErr)
      }
      }
      task.resume()
  }
}
