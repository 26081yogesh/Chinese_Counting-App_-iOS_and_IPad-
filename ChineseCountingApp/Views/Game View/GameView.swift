

import SwiftUI

struct GameView: View {
    @State private var gameViewModel = GameViewModel()

    @AppStorage("showPinyin") private var showPinyin: Bool = true

    @Binding var path: [Destination]

    var body: some View {
        VStack {
            ProgressBar(
                currentQuestion: gameViewModel.currentQuestion,
                totalQuestion: gameViewModel.totalQuestions,
                score: gameViewModel.score
            )
            Spacer()
            NumberDisplayView(
                number: gameViewModel.currentOption,
                showPinyin: showPinyin
            ) {
                gameViewModel.playAudio(text: gameViewModel.currentOption.chinese)
            } onTogglePinyin: {
                showPinyin.toggle()
            }

            Spacer()

            QuizGridView(
                options: gameViewModel.options,
                onAnswerSelect: gameViewModel.selectOption
            )
        }
        .padding()
        .onAppear {
            gameViewModel.playAudio(text: gameViewModel.currentOption.chinese)
        }
        .sheet(isPresented: $gameViewModel.isGameOver) {
            GameOverView(score: gameViewModel.score, totalQuestions: gameViewModel.totalQuestions) {
                gameViewModel.resetGame()
            } onGoHome: {
                path = []
            }

        }.interactiveDismissDisabled()
    }
}

#Preview {
    GameView(
        path: .constant([])
    )
}
