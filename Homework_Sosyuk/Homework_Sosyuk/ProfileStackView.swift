//
//  ProfileStackView.swift
//  Homework_Sosyuk
//
//  Created by Nikita Sosyuk on 20.10.2020.
//  Copyright © 2020 Nikita Sosyuk. All rights reserved.
//

import UIKit

class ProfileStackView: UIStackView {

    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var surnameLabel: UILabel!
    @IBOutlet private var numberLabel: UILabel!
    
    func setProfileData(name: String, surname: String, number: String) {
        nameLabel.text = name
        surnameLabel.text = surname
        numberLabel.text = number
    }

}
