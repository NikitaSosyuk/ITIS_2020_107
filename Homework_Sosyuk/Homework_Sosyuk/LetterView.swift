//
//  LetterView.swift
//  Homework_Sosyuk
//
//  Created by Nikita Sosyuk on 21.10.2020.
//  Copyright © 2020 Nikita Sosyuk. All rights reserved.
//

import UIKit

class LetterView: UIView {
    
    @IBOutlet private var letterLabel: UILabel!
    
    override func awakeFromNib() {
        self.backgroundColor = .systemGray3
        self.layer.cornerRadius = self.frame.height / 2
        
        letterLabel.textColor = .white
    }
    
    func setLetter(_ letter : String) {
        letterLabel.text = letter
    }
    
}
