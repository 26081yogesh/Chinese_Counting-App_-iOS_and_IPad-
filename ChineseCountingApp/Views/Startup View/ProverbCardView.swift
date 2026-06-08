import SwiftUI

struct ProverbCardView: View {
    let proverbModel: ProverbModel?
    let isLoading: Bool
    let isIPad: Bool

    var body: some View {
        GroupBox {
            Divider()

            if isLoading {
                ProgressView("Welcome | 欢迎 | Huānyíng")
                    .controlSize(.regular)
                    .tint(.indigo)
                    .padding(.vertical, 8)
            } else if let proverbModel {
                ProverbContentView(proverbModel: proverbModel, isIPad: isIPad)
            } else {
                Text("No Proverb Available")
                    .font(isIPad ? .headline : .callout)
            }
        } label: {
            Label(
                "Daily Wisdom",
                systemImage: "wand.and.sparkles"
            )
            .font(.headline)
            .foregroundStyle(.indigo)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProverbCardView(
        proverbModel: ProverbModel.defaultQuote(),
        isLoading: false,
        isIPad: false
    )
}
