
import Foundation

@Observable
class GameViewModel {
    var currentOption: OptionModel = GameData.getRandomOption()
    var options: [OptionModel] = []
    var currentQuestion = 1
    var score = 0
    var isGameOver = false

    let totalQuestions: Int

    init(totalQuestions: Int = 10) {
        self.totalQuestions = totalQuestions
        generateOptions()
    }

    func generateOptions() {
        let correct = currentOption
        var wrong: [OptionModel] = []

        while wrong.count < 3 {
            let randomOption = GameData.getRandomOption()
            if randomOption != correct, !wrong.contains(randomOption) {
                wrong.append(randomOption)
            }
        }

        options = wrong
        options.append(correct)
        options = options.shuffled()
    }

    func nextQuestions() {
        if currentQuestion >= totalQuestions {
            isGameOver = true
        } else {
            currentQuestion += 1
            currentOption = GameData.getRandomOption()
            generateOptions()
        }
    }

    func selectOption(selected: OptionModel) {
        let isCorrect = selected == currentOption
        if isCorrect {
            score += 1
        }

        nextQuestions()
    }

    func resetGame() {
        score = 0
        currentQuestion = 1
        isGameOver = false
        currentOption = GameData.getRandomOption()
        generateOptions()
    }

    func playAudio(text: String) {
        SpeechManager.shared.speakChinese(text: text)
    }
}
