//
//  ImmersiveView.swift
//  VisionOSPlayground
//
//  Created by Daniel Reyes on 27/06/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

// TODO: - Delete if not used anymore, this was just an example
struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            if let scene = try? await Entity(named: "ImmersiveScene", in: realityKitContentBundle) {
                content.add(scene)
            }
        }
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
