//
//  Valuta.swift
//  App
//
//  Created by Даниил Максимчик on 5/22/20.
//

import Foundation

struct PriorCurrencyResponse:Decodable {
  //var meta:Meta
  var data:[CurrencyRate]
}

struct Meta:Decodable {
  var offset:Int            //Порядковый номер записи в общем количестве записей, с которого предоставляется ответ ,
  var count:Int            //Количество записей в ответе ,
  var total:Int            //Общее количество записей в системе
  var processingDate:String   //Время формирования ответа в системе-источнике
}

struct CurrencyRate:Decodable {
  //var channel:Int        //Код канала установки курсов валют
  //var bankUnit:BankUnitDetail     //Подразделение банка, для которого установлен курс валют ,
  var validFrom:String        //Дата и время начала действия курса ,
  //var baseCurrency:Int     //Цифровой код иностранной валюты, по отношению к которой установлен официальный курс белорусского                                рубля. Источник - /reference-data/currencies ,
  //var baseCurrencyNominal:Int   //Количество единиц иностранной валюты, по отношению к которой установлен официальный курс                                       белорусского рубля ,
  //var baseCurrencyPayType:Int
  //var ratedCurrency:Int          //Цифровой код национальной валюты (белорусский рубль), официальный курс которой                                                   устоановлен Национальным банком Республики Беларусь ,
  //var ratedCurrencyPayType:Int
  var rate:ExchangeRate            //Значение официального курса белорусского рубля по отношению к заданной иностранной валюте
}

struct BankUnitDetail:Decodable {
  var code:Int                    //Код подразделения банка.
  var region:Int                  //Код области подразделения банка
  var city:Int                    //Код населенного пункта подраделения банка.
  var district:Int                //Код района населенного пункта подразделения банка.
}

struct ExchangeRate:Decodable {
  //var quantityFrom:Double            //Количество единиц первой валюты операции с которого начинает действовать курс ,
  //var quantityTo:Float              //Количество единиц первой валюты операции до которого действует курс ,
  var sellRate:Float                //Курс продажи валюты ,
  var buyRate:Float                 //Курс покупки валюты
}
