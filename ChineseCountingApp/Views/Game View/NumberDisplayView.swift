

import SwiftUI

struct NumberDisplayView: View {
    let number: OptionModel
    let showPinyin: Bool
    let onPlayAudio: () -> Void
    let onTogglePinyin: () -> Void

    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass

    var isIPad: Bool {
        return horizontalSizeClass == .regular && verticalSizeClass == .regular
    }

    var body: some View {
        GroupBox {
            VStack {
                Text(number.chinese)
                    .font(.system(size: 80, weight: .bold))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.indigo, .purple],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )

                Text(number.pinyin)
                    .font(isIPad ? .largeTitle : .title2)
                    .opacity(showPinyin ? 1 : 0)

                Text("What number is this?")
            }
        } label: {
            HStack {
                Button {
                    onTogglePinyin()
                } label: {
                    Label("Pinyin", systemImage: showPinyin ? "eye" : "eye.slash")
                }

                Spacer()

                Button {
                    onPlayAudio()
                } label: {
                    Image(systemName: "volume.2.fill")
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.indigo)
        }
    }
}

#Preview {
    NumberDisplayView(
        number: OptionModel.one,
        showPinyin: true,
        onPlayAudio: { print("Play Audio") },
        onTogglePinyin: {}
    )
    .padding()
}
