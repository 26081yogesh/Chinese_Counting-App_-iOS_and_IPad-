
import SwiftUI

struct GradientButtonView: View {
    let title: String
    let systemImage: String
    let isIPad: Bool
    let action: () -> Void

    let linearGradient: LinearGradient = .init(
        colors: [.indigo, .purple],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    var body: some View {
        Button {
            action()
        } label: {
            Label(title, systemImage: systemImage)
                .font(isIPad ? .title.bold() : .headline.bold())
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundStyle(.white)
        }
        .background(
            linearGradient
        )
        .clipShape(Capsule())
        .shadow(radius: isIPad ? 5 : 2.5)
        .tint(linearGradient)
    }
}

#Preview {
    GradientButtonView(
        title: "Start Learning",
        systemImage: "play.fill",
        isIPad: false
    ) {
        // Trailing Closure
    }
    .padding()
}
