//
//  ContentView.swift
//  VisionOSPlayground
//
//  Created by Daniel Reyes on 23/06/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct AnimatedSpaceView: View {

    @State var enlarge = false
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @ObservedObject var animal: Animal

    var body: some View {
        VStack {
            RealityView { content in
                if let animal = try? await Entity.load(named: animal.modelName) {
                    for animation in animal.availableAnimations {
                        animal.playAnimation(animation.repeat())
                    }
                    animal.position = [0,0,0]
                    content.add(animal)
                }
            } update: { content in
                // Update the RealityKit content when SwiftUI state changes
            }
            .gesture(TapGesture().targetedToAnyEntity().onEnded { value in
                // Handle tap gestures
            })
            Button("Open") {
                Task {
                    await openImmersiveSpace(id: AnimatedSpaceView.identifier)
                }
            }
            VStack {
                Text("Stats")
                    .font(.title)

                Toggle("Play Animation", isOn: $enlarge)
                    .toggleStyle(.button)
            }.padding().glassBackgroundEffect()
        }
    }
}

extension AnimatedSpaceView {
    static var identifier: String { String(describing: self) }
}

#Preview {
    AnimatedSpaceView(animal: SampleAnimal.butterfly)
}
