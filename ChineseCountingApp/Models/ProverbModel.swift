import Foundation

struct ProverbModel: Codable {
    let id, proverb, pinyin, translation: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case proverb, pinyin, translation
    }

    /// Static Function - It is a class level function, not related to an instance.
    static func defaultQuote() -> ProverbModel {
        .init(
            id: "63e6ae053bd28e8c186fdf38",
            proverb: "哑巴吃饺子，心里有数.",
            pinyin: "Yǎ ba chī jiǎo zi, xīn lǐ yǒu shù",
            translation: "When a mute eats dumplings, he knows how many he has eaten."
        )
    }
}
