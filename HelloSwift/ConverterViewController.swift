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
    
    //этот метод вызывается единожды 
    //за жизнь одного экрана
    //и является отличной точкой, для настройки и подготовки к работе
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        //станем делегатом нашего ConverterView
        converterView.delegate = self
    }
}

extension ConverterViewController : ConverterViewDelegate
{
    //конвертация из рублей в евро
    func converterView(view: ConverterView, convertForward value: String?) {
        //попробуем извлечь число из строки
        guard let rubText = value,
              let rubles = Double(rubText)  else {
            
                return
        }
        
        //пересчитаем валюту из рублей
        let euroes = converter.convertForward(amount: rubles)
        
        //запишем новое значение в правое поле для ввода
        view.fromValue = "\(euroes)"
    }
    
    func converterView(view: ConverterView, convertBackward value: String?) {
        
        guard let euroText = value,
            let euroes = Double(euroText) else {
                
                return
        }
        
        //получим из евро рубли
        let rubles = converter.convertBackward(amount: euroes)
        
        //запишем новое значение
        view.toValue = "\(rubles)"
    }
}
