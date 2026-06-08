

import SwiftUI

struct ProgressHeader: View {
    let currentQuestion: Int
    let totalQuestion: Int
    let score: Int

    var background: LinearGradient = .init(
        colors: [.yellow.opacity(0.25), .orange.opacity(0.25)],
        startPoint: .leading,
        endPoint: .trailing
    )

    var body: some View {
        HStack {
            Image(systemName: "trophy.fill")
                .foregroundStyle(.yellow)

            Text("Question \(currentQuestion) of \(totalQuestion)")
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)

            Spacer()

            HStack(spacing: 4) {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)

                Text("\(score) correct")
                    .fontWeight(.bold)
                    .foregroundStyle(.orange)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 4)
            .background(background, in: Capsule())
        }
    }
}

#Preview {
    ProgressHeader(
        currentQuestion: 5,
        totalQuestion: 10,
        score: 2
    )
    .padding()
}
