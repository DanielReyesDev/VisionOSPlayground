//
//  InformationView.swift
//  VisionOSPlayground
//
//  Created by Daniel Reyes on 28/06/23.
//

import SwiftUI

struct InformationView: View {
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @ObservedObject var animal: Animal
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            Text(animal.name)
                .font(.system(size: 30, weight: .bold))
            Spacer()
            Text(animal.description)
                .multilineTextAlignment(.leading)
                .font(.headline)
                .frame(width: 340)
                .padding(.bottom, 10)
            Spacer()
            Button(action: {
                print("Open Immersive experience!")
                Task {
                    // Calls previously Immersive Space defined in VisionOSPlaygroundApp
                    await openImmersiveSpace(id: SpaceViewConstants.animatedSpaceViewID)
                }
            }, label: {
                Text("Show me")
            })
            Spacer()
        }
        .padding(.horizontal, 150)
        .frame(width: 634, height: 499)
        .glassBackgroundEffect(
            in: RoundedRectangle(
                cornerRadius: 32,
                style: .continuous
            )
        )
        .onAppear {
            // Handle onAppear
        }
    }
}

#Preview {
    InformationView(animal: SampleAnimal.butterfly)
}
