//
//  ProfileViewController.swift
//  Homework_Sosyuk
//
//  Created by Nikita Sosyuk on 20.10.2020.
//  Copyright © 2020 Nikita Sosyuk. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet private var letterView: LetterView!
    @IBOutlet private var stackView: ProfileStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setData(name: String, surname: String, number: String, letter: String) {
        stackView.setProfileData(name: name, surname: surname, number: number)
        letterView.setLetter(letter)
    }

}
