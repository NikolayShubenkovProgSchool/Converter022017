//
//  ConverterViewController.swift
//  HelloSwift
//
//  Created by Nikolay Shubenkov on 25/02/2017.
//  Copyright © 2017 Nikolay Shubenkov. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    
    var converter =  Converter(forwardRatio: 1 / 61.9,
                               backwardRatio: 58.3,
                               precision: 2)
    
    @IBOutlet weak var converterView: ConverterView!
    
    
    
}
