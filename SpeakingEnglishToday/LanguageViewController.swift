//
//  LanguageViewController.swift
//  SpeakingEnglishToday
//
//  Created by Tung Fam on 10/12/17.
//  Copyright © 2017 Tung Fam. All rights reserved.
//

import UIKit

class LanguageViewController: UIViewController {

    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var greatDayLabel: UILabel!

    var chosenLanguage: Language!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        startClosingWithTimer()
    }

    private func setupUI() {
        setupGradientBackground()

        greatDayLabel.text = "Have a great and productive workday 💫"

        // Strings depending on chosen day label
        let firstText: String
        let secondText: String

        switch chosenLanguage {
        case .english:
            firstText = "English 🇬🇧 Great choice 👍"
            secondText = "1. Take a flag 🏳\n 2. Read the phrase outloud 🗣\n 3. Put it on your table 🏃"
        case .other:
            firstText = "Other 🇺🇦🇷🇺🇹🇷 Good choice 😉"
            secondText = "Thanks! You may go wherever you were going 🙃"
        default:
            firstText = ""
            secondText = ""
        }

        firstLabel.text = firstText
        secondLabel.text = secondText
    }

    @IBAction func closeScreen(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    private func startClosingWithTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 15) { [weak self] in
            self?.dismiss(animated: true, completion: nil)
        }
    }

}
