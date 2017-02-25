//
//  HelloSwiftViewController.swift
//  HelloSwift
//
//  Created by Nikolay Shubenkov on 25/02/2017.
//  Copyright © 2017 Nikolay Shubenkov. All rights reserved.
//

import UIKit

class HelloSwiftViewController: UIViewController {

    @IBOutlet weak var nameInput: UITextField!
    
    @IBAction func helloButtonPressed(_ sender: UIButton) {
        //убедимся, что в поле для ввода есть какой-то текст
        guard nameInput?.text?.isEmpty == false,
            //считаем текст с поля для ввода
              let userName = nameInput?.text  else {
            return
        }
        
        let greeting = "Здравстуйте, \(userName)"
        
        //создадим контроллер, который показывает всплывающее сообщение
        let alert = UIAlertController(title: "Урааа!!",
                                      message: greeting,
                                      preferredStyle: .alert)
        
        //создадим кнопку для всплывающего сообщего сообщения
        let helloAction = UIAlertAction(title: "Привет!",
                                        style: .default) { action in
                                            print("Пользователь нажал :\(action)")
        }
        
        //добавим кнопку на новый контроллер
        alert.addAction(helloAction)
        
        //предтсавим на экране всплывающее сообщение
        present(alert,
                animated: true,
                completion: nil)
    }
    
    
    
}
