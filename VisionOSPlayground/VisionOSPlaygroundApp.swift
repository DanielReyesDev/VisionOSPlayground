//
//  VisionOSPlaygroundApp.swift
//  VisionOSPlayground
//
//  Created by Daniel Reyes on 23/06/23.
//

import SwiftUI

@main
struct VisionOSPlaygroundApp: App {
    @State var immersionState: ImmersionStyle = .mixed

    static let currentAnimal = SampleAnimal.butterfly

    var body: some Scene {
        WindowGroup {
            InformationView(animal: Self.currentAnimal)
        }.windowStyle(.plain)

        // Define the Immersive Space
        ImmersiveSpace(id: AnimatedSpaceView.identifier) {
            AnimatedSpaceView(animal: Self.currentAnimal)
        }.immersionStyle(selection: $immersionState, in: .mixed)
    }
}

enum SpaceViewConstants {
    static let animatedSpaceViewID = "AnimatedSpaceView"
}
