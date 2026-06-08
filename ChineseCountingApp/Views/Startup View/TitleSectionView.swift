
import SwiftUI

struct TitleSectionView: View {
    let isIPad: Bool

    let linearGradient: LinearGradient = .init(colors: [.indigo, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)

    var body: some View {
        VStack {
            Text("数")
                .font(
                    .system(size: isIPad ? 160 : 80, weight: .bold)
                )
                .padding()
                .background(linearGradient)
                .clipShape(Circle())
                .foregroundColor(.white)
                .shadow(radius: isIPad ? 10 : 5)

            Text("Chinese Numbers")
                .font(isIPad ? .largeTitle : .title)
                .fontWeight(.bold)

            Text("Learn numbers the fun way!")
                .font(isIPad ? .title2 : .subheadline)
                .foregroundStyle(.secondary)
        }.multilineTextAlignment(.center)
    }
}

#Preview {
    VStack {
        TitleSectionView(isIPad: false)
    }
}
