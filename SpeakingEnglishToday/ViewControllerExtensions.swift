//
//  ViewControllerExtensions.swift
//  SpeakingEnglishToday
//
//  Created by Tung Fam on 10/13/17.
//  Copyright © 2017 Tung Fam. All rights reserved.
//

import UIKit

extension UIViewController {

    fileprivate struct Constants {
        static let gradientBlue = UIColor(red: 7/255.0,
                                                green: 38/255.0,
                                                blue: 120/255.0,
                                                alpha: 0.3)

        static let gradientRed = UIColor(red: 190/255.0,
                                                    green: 46/255.0,
                                                    blue: 51/255.0,
                                                    alpha: 0.3)

        static let loaderSize: CGFloat = 40.0
    }

    func setupGradientBackground() {
        let gradientView = GradientView(frame: view.frame)
        view.addSubview(gradientView)
        view.sendSubview(toBack: gradientView)

        gradientView.startColor = Constants.gradientBlue
        gradientView.endColor = Constants.gradientRed
    }

}
