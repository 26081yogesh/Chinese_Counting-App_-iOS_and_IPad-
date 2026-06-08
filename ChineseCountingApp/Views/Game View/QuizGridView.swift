import SwiftUI

struct QuizGridView: View {
    let options: [OptionModel]
    let onAnswerSelect: (OptionModel) -> Void

    var body: some View {
        LazyVGrid(
            columns: [
                GridItem(),
                GridItem(),
            ],
            spacing: 16
        ) {
            ForEach(options) { option in
                Button {
                    onAnswerSelect(option)
                } label: {
                    Text("\(option.number)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                }
                .background(.blue.opacity(0.2))
                .clipShape(.rect(cornerRadius: 20))
            }
        }
    }
}

#Preview {
    QuizGridView(
        options: [
            OptionModel.one,
            OptionModel.two,
            OptionModel.three,
            OptionModel.four,
        ],
        onAnswerSelect: { _ in }
    )
    .padding()
}
