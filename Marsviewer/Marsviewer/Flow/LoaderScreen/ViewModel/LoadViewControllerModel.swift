//
//  LoadViewControllerModel.swift
//  Marsviewer
//
//  Created by Plate on 29.08.2024.
//

import Foundation

protocol Launchable
{
    var loadingSec: Double { get }
}

class LoaderViewModel: Launchable {
    var loadingSec: Double = 1.5
}
