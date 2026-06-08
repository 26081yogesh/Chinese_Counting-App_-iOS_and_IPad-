
import SwiftUI

struct ProgressBar: View {
    let currentQuestion: Int
    let totalQuestion: Int
    let score: Int

    let thickness: CGFloat = 10.0

    var progress: CGFloat {
        totalQuestion > 0 ? CGFloat(currentQuestion) / CGFloat(totalQuestion) : 0
    }

    var scoreProgress: CGFloat {
        currentQuestion > 1 ? CGFloat(score) / CGFloat(totalQuestion - 1) : 0
    }

    @State private var isAnimated = false

    var body: some View {
        VStack {
            ProgressHeader(
                currentQuestion: currentQuestion,
                totalQuestion: totalQuestion,
                score: score
            )

            ZStack {
                Capsule()
                    .fill(.secondary.opacity(0.5))
                    .frame(height: thickness)

                ProgressView(value: isAnimated ? progress : 0)
                    .progressViewStyle(
                        CustomProgressViewStyle(
                            colors: [.mint, .teal],
                            thickness: thickness
                        )
                    )

                ProgressView(value: isAnimated ? scoreProgress : 0)
                    .progressViewStyle(
                        CustomProgressViewStyle(
                            colors: [.yellow.opacity(0.25), .orange.opacity(0.25)],
                            thickness: thickness
                        )
                    )
                    .tint(.red)
            }
        }
        .padding()
        .background(
            .white.opacity(0.85)
        )
        .clipShape(.rect(cornerRadius: 25))
        .shadow(radius: 6)
        .onAppear {
            isAnimated = true
        }
    }
}

struct CustomProgressViewStyle: ProgressViewStyle {
    var colors: [Color]
    var thickness: CGFloat = 10.0

    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            Capsule()
                .fill(
                    LinearGradient(
                        colors: colors,
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .scaleEffect(x: configuration.fractionCompleted ?? 0, anchor: .leading)
                .animation(.easeOut, value: configuration.fractionCompleted)
        }
        .frame(height: thickness)
        .clipShape(Capsule())
    }
}

#Preview {
    ProgressBar(
        currentQuestion: 8,
        totalQuestion: 10,
        score: 5
    )
    .padding()
}
