//
//  PollViewController.swift
//  SpeakingEnglishToday
//
//  Created by Tung Fam on 10/12/17.
//  Copyright © 2017 Tung Fam. All rights reserved.
//

import UIKit

class PollViewController: UIViewController {

    @IBOutlet weak var goodMorningLabel: UILabel!
    @IBOutlet weak var englishButton: UIButton!
    @IBOutlet weak var otherButton: UIButton!
    @IBOutlet weak var englishCounterLabel: UILabel!
    @IBOutlet weak var otherCounterLabel: UILabel!

    private var chosenLanguage: Language?
    private let defaults = UserDefaults.standard

    private struct Constants {
        static let EnglishKey = "English"
        static let OtherKey = "Other"
        static let ShowLanguageScreenId = "ShowLanguageScreen"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupCountersData()
    }

    private func setupUI() {
        setupGradientBackground()

        goodMorningLabel.text = "Good morning 👋"

        englishButton.layer.borderWidth = 2
        englishButton.layer.cornerRadius = 10
        englishButton.layer.borderColor = UIColor(red: 0, green: 122/255.0, blue: 1.0, alpha: 1.0).cgColor
        englishButton.setTitle("ENGLISH", for: .normal)

        otherButton.layer.borderWidth = 2
        otherButton.layer.cornerRadius = 10
        otherButton.layer.borderColor = UIColor(red: 0, green: 122/255.0, blue: 1.0, alpha: 1.0).cgColor
        otherButton.setTitle("OTHER", for: .normal)
    }

    @IBAction func showEnglishScreen(_ sender: UIButton) {
        incrementLanguageCounter(.english)
        chosenLanguage = .english

        showLanguageScreen(.english)
    }

    @IBAction func showOtherScreen(_ sender: UIButton) {
        incrementLanguageCounter(.other)
        chosenLanguage = .other

        showLanguageScreen(.other)
    }

    private func showLanguageScreen(_ language: Language) {
        performSegue(withIdentifier: Constants.ShowLanguageScreenId, sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let languageVC = segue.destination as? LanguageViewController {
            languageVC.chosenLanguage = chosenLanguage
        }
    }

    private func incrementLanguageCounter(_ language: Language) {
        let key: String

        switch language {
        case .english:
            key = Constants.EnglishKey
        case .other:
            key = Constants.OtherKey
        }

        let currentValue = defaults.integer(forKey: key)
        let incrementedValue = currentValue + 1
//        let incrementedValue = 0
        defaults.set(incrementedValue, forKey: key)

        setupCountersData()
    }

    private func setupCountersData() {
        let englishCounter = defaults.integer(forKey: Constants.EnglishKey)
        englishCounterLabel.text = "counter: \(englishCounter)"


        let otherCounter = defaults.integer(forKey: Constants.OtherKey)
        otherCounterLabel.text = "counter: \(otherCounter)"
    }

}

enum Language {
    case english, other
}
