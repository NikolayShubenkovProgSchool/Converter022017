//
//  ConverterView.swift
//  HelloSwift
//
//  Created by Nikolay Shubenkov on 25/02/2017.
//  Copyright © 2017 Nikolay Shubenkov. All rights reserved.
//

import UIKit

//чтобы можно быо иметь слабую сслыку 
//зададим наследование нашего протокола 
//от протокола class
protocol ConverterViewDelegate:class {
    func converterView(view:ConverterView, convertForward value:String?)
    func converterView(view:ConverterView, convertBackward value:String?)
}

class ConverterView: UIView {

    weak var delegate:ConverterViewDelegate?
    
    var toValue:String? {//слева
        set {
            toTextField?.text = newValue
        }
        get {
            return toTextField?.text
        }
    }

    var fromValue:String? {//справа
        get {
            return fromTextField?.text
        }
        set {
            fromTextField?.text = newValue
        }
    }
    
    @IBOutlet private  weak var toTextField:UITextField?
    @IBOutlet private  weak var fromTextField:UITextField?
    
    @IBAction func forwardPressed(){
        delegate?.converterView(view: self,
                                convertForward: fromValue)
    }
    
    @IBAction func backwardPressed(){
        delegate?.converterView(view: self,
                                convertBackward: toValue)
    }
    
    //переопределим инициализатор UIVIew
    //он вызывается при инициализации из storyborad
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup(){
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
    }
}
