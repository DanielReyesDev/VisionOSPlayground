//
//  Animal.swift
//  VisionOSPlayground
//
//  Created by Daniel Reyes on 28/06/23.
//

import Foundation

final class Animal: ObservableObject {
    let name: String
    let description: String
    let modelName: String

    init(name: String, description: String, modelName: String) {
        self.name = name
        self.description = description
        self.modelName = modelName
    }
}
