
import SwiftUI

struct GameOverView: View {
    let score: Int
    let totalQuestions: Int
    let onPlayAgain: () -> Void
    let onGoHome: () -> Void

    @State private var animateIcon = false
    @State private var animateText = false
    @State private var animateScore = false
    @State private var animateButtons = false

    var percentage: Int {
        guard totalQuestions > 0 else { return 0 }
        return Int(Double(score) / Double(totalQuestions) * 100)
    }

    func performanceResult(
        message: String,
        colors: [Color],
        iconName: String
    ) -> (message: String, gradient: LinearGradient, icon: Image) {
        (message,
         LinearGradient(colors: colors, startPoint: .leading, endPoint: .trailing),
         Image(systemName: iconName))
    }

    var performance: (message: String, gradient: LinearGradient, icon: Image) {
        switch percentage {
        case 90...:
            return performanceResult(message: "Outstanding! 太棒了!", colors: [.yellow, .orange], iconName: "trophy.fill")
        case 70 ..< 90:
            return performanceResult(message: "Great job! 很好!", colors: [.blue, .indigo], iconName: "star.fill")
        case 50 ..< 70:
            return performanceResult(message: "Good effort! 不错!", colors: [.purple, .pink], iconName: "sparkles")
        default:
            return performanceResult(message: "Keep practicing! 继续努力!", colors: [.green, .teal], iconName: "sparkles")
        }
    }

    var body: some View {
        ZStack {
            VStack(spacing: 24) {
                performance.icon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .padding()
                    .background(performance.gradient)
                    .clipShape(Circle())
                    .shadow(radius: 8)
                    .scaleEffect(animateIcon ? 1 : 0)
                    .animation(
                        .spring(response: 0.6, dampingFraction: 0.5).delay(0.2),
                        value: animateIcon
                    )

                // MARK: Title

                Text("Game Complete!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
                    .opacity(animateText ? 1 : 0)
                    .offset(y: animateText ? 0 : 20)
                    .animation(
                        .easeOut(duration: 0.6).delay(0.4),
                        value: animateText
                    )

                // MARK: Performance message

                Text(performance.message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(performance.gradient)
                    .opacity(animateText ? 1 : 0)
                    .offset(y: animateText ? 0 : 20)
                    .animation(
                        .easeOut(duration: 0.6).delay(0.4),
                        value: animateText
                    )

                // MARK: Score card

                VStack(spacing: 8) {
                    Text("\(score) / \(totalQuestions)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)

                    Text("\(percentage)%")
                        .fontWeight(.medium)
                        .foregroundStyle(.secondary)

                    HStack(spacing: 8) {
                        ForEach(0 ..< totalQuestions, id: \.self) { i in
                            Circle()
                                .fill(
                                    i < score ? Color.green : Color.gray.opacity(0.4)
                                )
                                .frame(width: 12, height: 12)
                                .scaleEffect(animateScore ? 1 : 0)
                                .animation(
                                    .spring(response: 0.3).delay(0.8 + Double(i) * 0.05),
                                    value: animateScore
                                )
                        }
                    }
                }
                .padding()
                .background(
                    LinearGradient(colors: [Color.blue.opacity(0.1), Color.gray.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .clipShape(.rect(cornerRadius: 20))
                .scaleEffect(animateScore ? 1 : 0.8)
                .animation(
                    .spring(response: 0.6).delay(0.6),
                    value: animateScore
                )

                // MARK: Buttons

                VStack(spacing: 12) {
                    Button {
                        onPlayAgain()
                    } label: {
                        Label("Play Again", systemImage: "arrow.clockwise")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(LinearGradient(colors: [.green, .blue], startPoint: .leading, endPoint: .trailing))
                            .foregroundStyle(.white)
                            .clipShape(.rect(cornerRadius: 16))
                            .shadow(radius: 4)
                    }

                    Button {
                        onGoHome()
                    } label: {
                        Label("Back to Home", systemImage: "house.fill")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .overlay {
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(
                                        Color.gray.opacity(0.6),
                                        lineWidth: 2
                                    )
                            }
                    }
                }
                .opacity(animateButtons ? 1 : 0)
                .offset(y: animateButtons ? 0 : 20)
                .animation(
                    .easeOut(duration: 0.6).delay(0.9),
                    value: animateButtons
                )
            }
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(.rect(cornerRadius: 30))
            .shadow(radius: 20)
            .padding()
        }
        .onAppear {
            animateIcon = true
            animateText = true
            animateScore = true
            animateButtons = true
        }
    }
}

#Preview {
    GameOverView(
        score: 7,
        totalQuestions: 10,
        onPlayAgain: {},
        onGoHome: {}
    )
}
