//
//  ViewController.swift
//  UserDefaultsVibeLabHomeWork
//
//  Created by Арсений on 12/26/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let storage: StorageManagerProtocol = StorageManager()
    let userDefaluts = UserDefaults.standard
    
    lazy var changeButton: UIButton = {
        let action = UIAction { _ in
            self.changeColor()
        }
        
        let button = UIButton(configuration: .filled(), primaryAction: action)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Меняй", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let colorData = userDefaluts.data(forKey: StorageManager.Keys.test.rawValue) {
            let jsonDecoder = JSONDecoder()
            guard let color = try? jsonDecoder.decode(Color.self, from: colorData) else { return }
            
//            view.backgroundColor = UIColor(red: color.redValue, green: color.greenValue, blue: color.blueValue, alpha: 1.0)
        }
        
        view.backgroundColor = .white
        setup()
    }
    
    func setup() {
        view.addSubview(changeButton)
        NSLayoutConstraint.activate([
            changeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            changeButton.widthAnchor.constraint(equalToConstant: 140),
        ])
    }
    
    func changeColor() {
        let color = Color()
        var redValue = color.redValue
        var greenValue = color.greenValue
        var blueValue = color.blueValue
        
        self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        
//        storage.set(object: color, forKey: .test)
    }


}

