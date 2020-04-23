//
//  PopUpWindow.swift
//  DemoComponents
//
//  Created by nghiadang1205 on 3/21/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

protocol PopUpDelegate {
    func handleDismissal()
}

class PopUpWindow: UIView {

    // MARK: - Properties
    var delegate: PopUpDelegate?
    
    var showSuccessMessage: Bool? {
        didSet {
            guard let success = showSuccessMessage else {
                return
            }
            
            if success {
                checkLabel.text = "✓"
                notificationLabel.text = "Success"
                checkLabel.textColor = UIColor(red: 147/255, green: 227/255, blue: 105/255, alpha: 1)
                notificationLabel.textColor = UIColor(red: 147/255, green: 227/255, blue: 105/255, alpha: 1)
            } else {
                checkLabel.text = "❌"
                notificationLabel.text = "Error"
                checkLabel.textColor = UIColor(red: 227/255, green: 147/255, blue: 105/255, alpha: 1)
                notificationLabel.textColor = UIColor(red: 227/255, green: 147/255, blue: 105/255, alpha: 1)
            }
        }
    }
    
    let checkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 147/255, green: 227/255, blue: 105/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 96)
        label.text = "✓"
        return label
    }()
    
    let notificationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 147/255, green: 227/255, blue: 105/255, alpha: 1)
        label.font = UIFont(name: "Avenir", size: 24)
        label.text = "Success"
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your name ..."
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    
    
    let button: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.backgroundColor = .systemBlue
        button.setTitle("OK", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(checkLabel)
        checkLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        checkLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -28).isActive = true
        
        addSubview(notificationLabel)
        notificationLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        notificationLabel.topAnchor.constraint(equalTo: checkLabel.bottomAnchor, constant: 0).isActive = true
        
        addSubview(nameTextField)
        nameTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: notificationLabel.bottomAnchor, constant: 0).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        
        addSubview(button)
        button.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        button.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        button.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapToHideKeyboard))
        addGestureRecognizer(tapGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    // MARK: Selectors
    @objc func handleDismissal() {
        print("Dismiss pop up...")
        print(nameTextField.text ?? "")
        delegate?.handleDismissal()
    }
    
    @objc func tapToHideKeyboard() {
        nameTextField.endEditing(true)
       }

}
