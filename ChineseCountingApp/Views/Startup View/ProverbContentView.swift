
import SwiftUI

struct ProverbContentView: View {
    let proverbModel: ProverbModel
    let isIPad: Bool

    var body: some View {
        VStack(spacing: isIPad ? 12 : 8) {
            VStack {
                Text("\"\(proverbModel.proverb)\"")
                    .font(isIPad ? .title : .title3)
                    .foregroundStyle(.primary)

                Text(proverbModel.pinyin)
                    .font(isIPad ? .title2 : .headline)
                    .foregroundStyle(.secondary)
            }
            .onTapGesture {
                SpeechManager.shared.speakChinese(text: proverbModel.proverb)
            }
            Text(proverbModel.translation)
                .font(isIPad ? .title3 : .subheadline)
                .foregroundStyle(.secondary)
                .onTapGesture {
                    SpeechManager.shared.speakEnglish(text: proverbModel.translation)
                }
        }
        .multilineTextAlignment(.center)
        .padding()
    }
}

#Preview {
    ProverbContentView(
        proverbModel: ProverbModel.defaultQuote(),
        isIPad: false
    )
}
