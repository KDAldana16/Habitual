//
//  UIViewControllerExtensions.swift
//  Habitual
//
//  Created by Karla Aldana on 2/27/20.
//  Copyright © 2020 Karla Aldana. All rights reserved.
//

import UIKit

extension UIViewController {
    static func instantiate() -> Self {
        return self.init(nibName: String(describing: self), bundle: nil)
    }
}
