//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let mainView: UIView = {
        let main = UIView()
        // important when setting contraints programmatically
        main.translatesAutoresizingMaskIntoConstraints = false
        main.backgroundColor = .green
        return main
    }()
    
    let squareButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Square", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
        return butt
    }()
    
    let portraitButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Portrait", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
        return butt
    }()
    
    let landScapeButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Landscape", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
        return butt
    }()
    
    
    // declare/ invole my views
    let purpleBox:UIView = {
        let box:UIView = UIView(frame: CGRect.zero)
        box.translatesAutoresizingMaskIntoConstraints = false
        box.backgroundColor = .purple
        box.heightAnchor.constraint(equalToConstant: 90).isActive = true
        return box
    }()
    
    let redStack:UIStackView = {
        let stack:UIStackView = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .red
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 10
        stack.widthAnchor.constraint(equalToConstant: 250).isActive = true
        stack.heightAnchor.constraint(equalToConstant: 90).isActive = true
        return stack
    }()
    
    lazy var blueBoxStack: UIStackView = {
        let stack:UIStackView = UIStackView(arrangedSubviews: [blueBox(), blueBox(), blueBox()])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalCentering
        stack.alignment = .center
        return stack
    }()
    
    func orangeBox()->UIView {
        let box:UIView = UIView()
        box.translatesAutoresizingMaskIntoConstraints = false
        box.backgroundColor = .orange
        return box
    }
    
    func blueBox()->UIView {
        let box:UIView = UIView(frame: CGRect.zero)
        box.translatesAutoresizingMaskIntoConstraints = false
        box.backgroundColor = .blue
        let length:Double = 90
        box.widthAnchor.constraint(equalToConstant: length).isActive = true
        box.heightAnchor.constraint(equalToConstant: length).isActive = true
        return box
    }
    
    var widthAnchor: NSLayoutConstraint?
    var heightAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainView)
        setupLayout()
    }
    
    fileprivate func setupLayout() {
        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
        widthAnchor?.isActive = true
        
        heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
        heightAnchor?.isActive = true
        
        
        // add my views to the main view
        mainView.addSubview(purpleBox)
        purpleBox.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.6).isActive = true
        purpleBox.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20).isActive = true
        purpleBox.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20).isActive = true
        
        mainView.addSubview(redStack)
        let orangeBox1 = orangeBox()
        let orangeBox2 = orangeBox()
        let leadingBox = UIView()
        let trailingBox = UIView()
        redStack.addArrangedSubview(leadingBox)
        redStack.addArrangedSubview(orangeBox1)
        redStack.addArrangedSubview(orangeBox2)
        redStack.addArrangedSubview(trailingBox)
        
        orangeBox1.widthAnchor.constraint(equalTo: redStack.widthAnchor, multiplier: 0.6).isActive = true
        orangeBox1.heightAnchor.constraint(equalTo: redStack.heightAnchor, multiplier: 0.8).isActive = true
        orangeBox2.widthAnchor.constraint(equalTo: redStack.widthAnchor, multiplier: 0.25).isActive = true
        orangeBox2.heightAnchor.constraint(equalTo: redStack.heightAnchor, multiplier: 0.8).isActive = true
        
        redStack.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10).isActive = true
        redStack.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10).isActive = true
        
        mainView.addSubview(blueBoxStack)
        blueBoxStack.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.7).isActive = true
        blueBoxStack.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        blueBoxStack.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        
        
        let buttStackView = UIStackView(arrangedSubviews: [
            squareButton, portraitButton, landScapeButton])
        buttStackView.translatesAutoresizingMaskIntoConstraints = false
        buttStackView.axis = .horizontal
        buttStackView.alignment = .center
        buttStackView.distribution = .fillEqually
        
        view.addSubview(buttStackView)
        NSLayoutConstraint.activate([
            buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttStackView.heightAnchor.constraint(equalToConstant: 50),
            buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    @objc private func squareTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func portraitTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
        
    }
    
    @objc private func landscapeTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
    }
}

