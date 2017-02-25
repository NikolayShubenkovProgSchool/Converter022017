//
//  Converter.swift
//  HelloSwift
//
//  Created by Nikolay Shubenkov on 25/02/2017.
//  Copyright © 2017 Nikolay Shubenkov. All rights reserved.
//

import Foundation

struct Converter {
    
    let forwardRatio:Double
    let backwardRatio:Double
    
    var precision:Int
    
    func convertForward(amount:Double)->Double
    {
        
        return roundValue(amount: amount * forwardRatio,
                          precision: self.precision)
    }
    
    func convertBackward(amount:Double)->Double
    {
        return roundValue(amount: amount * backwardRatio,
                          precision: self.precision)
    }
    
    private func roundValue(amount:Double, precision:Int)->Double
    {
        //пусть amount = 2.5555555
        //precision = 2
        //multiply 100
        let multiply = pow(10, Double(precision))
        
        
        //эта часть округлит наше число до целых
        //но т.к. мы его умножили в несколько раз, 
        //то, если потом
        //round (2.555555 * 100) = round (255.555555) = 255
        let newValue = round(amount * multiply)
        
        //255 / 100 = 2.55
        return newValue / multiply
        
    }
    
}
