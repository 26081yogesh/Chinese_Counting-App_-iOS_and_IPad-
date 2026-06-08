import Foundation

struct OptionModel: Identifiable, Equatable {
    let id = UUID()
    let number: Int
    let chinese: String
    let pinyin: String

    static let one: OptionModel = .init(number: 1, chinese: "一", pinyin: "yī")
    static let two: OptionModel = .init(number: 2, chinese: "二", pinyin: "èr")
    static let three: OptionModel = .init(number: 3, chinese: "三", pinyin: "sān")
    static let four: OptionModel = .init(number: 4, chinese: "四", pinyin: "sì")
}
