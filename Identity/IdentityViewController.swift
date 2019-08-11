//
//  IdentityViewController.swift
//  Identity
//
//  Created by Or Israeli on 30/06/2019.
//  Copyright © 2019 Or Israeli. All rights reserved.
//
//dummy id number for testing: 789621349

import UIKit

class IdentityViewController: UIViewController {
    
    let titleLabel = UILabel()
    let infoText = UITextView()
    let idTextField = UITextField()
    let checkButton = UIButton()
    let resultView = UIView()
    let resultImageView = UIImageView()
    let resultLabel = UILabel()
    let footerText = UITextView()
    
    var idString: String = ""
    var id = Validation(idString: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTitleLabel()
        setupTextViews()
        setupIdTextField()
        setupCheckButton()
        setupResultView()
    }

    func setupIdTextField() {
        idTextField.keyboardType = .numberPad
        idTextField.placeholder = "id number"
        idTextField.borderStyle = .roundedRect
        
        view.addSubview(idTextField)
        setupIdTextFieldConstraints()
    }

    func setupIdTextFieldConstraints(){
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        idTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        idTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        idTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        idTextField.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -50).isActive = true
    }
    
    func setupCheckButton() {
        checkButton.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        checkButton.setTitle("CHECK", for: .normal)
        checkButton.layer.cornerRadius = 10
        checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        
        view.addSubview(checkButton)
        setupCheckButtonConstraints()
    }
    
    func setupCheckButtonConstraints(){
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        checkButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        checkButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        checkButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        checkButton.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 10).isActive = true
    }
    
    @objc func checkButtonTapped(){
        //read text input
        guard let stringFromTextField: String = idTextField.text
            else { return print("error unwrapping textfield") }
        
        id = Validation(idString: stringFromTextField)
        printResult(result: id.validateID())
    }
    
    func setupTitleLabel() {
        titleLabel.text = "Identity"
        titleLabel.font = .boldSystemFont(ofSize: 36)
        
        view.addSubview(titleLabel)
        setupTitleLabelConstraints()
    }
    
    func setupTitleLabelConstraints(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    }
    
    func setupTextViews() {
        for txtView in [infoText,footerText] {
            txtView.font = .systemFont(ofSize: 14)
            txtView.isEditable = false
            txtView.textColor = .lightGray
            txtView.dataDetectorTypes = .link
            txtView.linkTextAttributes = [.foregroundColor: UIColor.lightGray]
            view.addSubview(txtView)
        }
        infoText.text = """
        An algorithm which checks whether an Israeli ID number is valid.
        
        We do not store your information and never connect or send it to the internet.
        
        This is an open-source project you can take a look at https://github.com/orisraeli/Identity
        """
        footerText.text = "Made with ❤︎ by Or Israeli | https://orisraeli.com"
        footerText.textAlignment = .center
        
        setupInfoTextConstraints()
        setupFooterTextConstraints()
    }
    
    func setupInfoTextConstraints() {
        infoText.translatesAutoresizingMaskIntoConstraints = false
        infoText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        infoText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        infoText.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        infoText.heightAnchor.constraint(equalToConstant: 250).isActive = true
    }
    
    func setupFooterTextConstraints() {
        footerText.translatesAutoresizingMaskIntoConstraints = false
        footerText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        footerText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        footerText.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        footerText.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupResultView(){
        resultView.layer.cornerRadius = 5
        
        view.addSubview(resultView)
        setupResultViewConstraints()
        
        setupResultImageView()
        setupResultLabel()
    }
    
    func setupResultViewConstraints(){
        resultView.translatesAutoresizingMaskIntoConstraints = false
        resultView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        resultView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        resultView.topAnchor.constraint(equalTo: checkButton.bottomAnchor, constant: 10).isActive = true
        resultView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func setupResultImageView(){
        resultView.addSubview(resultImageView)
        setupResultImageViewConstraints()
    }
    
    func setupResultImageViewConstraints(){
        resultImageView.translatesAutoresizingMaskIntoConstraints = false
        resultImageView.leadingAnchor.constraint(equalTo: resultView.leadingAnchor, constant: 10).isActive = true
        resultImageView.centerYAnchor.constraint(equalTo: resultView.centerYAnchor, constant: 0).isActive = true
        resultImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        resultImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupResultLabel(){
        resultLabel.textColor = .white
        
        resultView.addSubview(resultLabel)
        setupResultLabelConstraints()
    }
    
    func setupResultLabelConstraints(){
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.leadingAnchor.constraint(equalTo: resultImageView.trailingAnchor, constant: 10).isActive = true
        resultLabel.trailingAnchor.constraint(equalTo: resultView.trailingAnchor, constant: 20).isActive = true
        resultLabel.centerYAnchor.constraint(equalTo: resultImageView.centerYAnchor, constant: 0).isActive = true
        resultLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    func printResult(result: Bool) {
        resultLabel.text = id.idResultText
        if result {
            resultView.backgroundColor = #colorLiteral(red: 0.07961467654, green: 0.7918785214, blue: 0.1005088463, alpha: 1)
            resultImageView.image = #imageLiteral(resourceName: "checkmark")
            
            idTextField.resignFirstResponder()
        }
        else {
            resultView.backgroundColor = #colorLiteral(red: 0.9876261353, green: 0.04807233065, blue: 0.01810991764, alpha: 1)
            resultImageView.image = #imageLiteral(resourceName: "x")
        }
    }
    
    //dismiss keyboard when user touch blank spots
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}
