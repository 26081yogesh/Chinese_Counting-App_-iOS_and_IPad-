import AVFoundation
import Foundation

// We will use Singleton class pattern. Since this class cannot be inherited we will use final

final class SpeechManager {
    static let shared = SpeechManager()
    private let synthesizer = AVSpeechSynthesizer()

    private init() {} // This is important since we dont want any instance of this class, so only way to access it SpeechManager.shared

    enum Language: String {
        case chinese = "zh-CN"
        case english = "en-US"
    }

    private func speak(text: String, language: Language) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.rate = 0.45
        utterance.pitchMultiplier = 0.7
        utterance.volume = 1.0

        if let voice = AVSpeechSynthesisVoice(language: language.rawValue) {
            utterance.voice = voice
        } else {
            print("Language \(language.rawValue) is not available")
        }

        if synthesizer.isSpeaking {
            synthesizer.pauseSpeaking(at: .immediate)
        }

        synthesizer.speak(utterance)
    }

    // MARK: Convenience Methods For Chinese/English

    func speakChinese(text: String) {
        speak(text: text, language: .chinese)
    }

    func speakEnglish(text: String) {
        speak(text: text, language: .english)
    }
}
