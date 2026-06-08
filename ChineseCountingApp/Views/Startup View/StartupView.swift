import SwiftUI

struct StartupView: View {
    @State private var startupViewModel = StartupViewModel()
    @State private var path: [Destination] = []

    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass

    var isIPad: Bool {
        horizontalSizeClass == .regular && verticalSizeClass == .regular
    }

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                TitleSectionView(isIPad: isIPad)
                Spacer()
                ProverbCardView(
                    proverbModel: startupViewModel.proverbModel,
                    isLoading: startupViewModel.isLoading,
                    isIPad: isIPad
                )
                Spacer()

                GradientButtonView(
                    title: "Start Learning",
                    systemImage: "play.fill",
                    isIPad: false
                ) {
                    path.append(Destination.game)
                }
            }
            .padding()
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .game:
                    GameView(path: $path)
                }
            }
            .task {
                await startupViewModel.fetchQuotes()

                if let proverbModel = startupViewModel.proverbModel {
                    SpeechManager.shared.speakChinese(text: proverbModel.proverb)
                    SpeechManager.shared.speakEnglish(text: proverbModel.translation)
                }
            }
        }
    }
}

#Preview {
    StartupView()
}
