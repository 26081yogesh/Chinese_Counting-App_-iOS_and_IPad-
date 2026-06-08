import Foundation

enum GameData {
    static let allOptions: [OptionModel] = (1 ... 99).map { num in
        .init(number: num, chinese: chinese(number: num), pinyin: pinyin(number: num))
    }

    static func getRandomOption() -> OptionModel {
        GameData.allOptions.randomElement() ?? OptionModel.one
    }

    static func chinese(number: Int) -> String {
        let digits = ["", "一", "二", "三", "四", "五", "六", "七", "八", "九"]

        if number <= 10 {
            return number == 10 ? "十" : digits[number]
        } else if number < 20 {
            return "十" + digits[number % 10]
        } else {
            let tens = digits[number / 10]
            let ones = digits[number % 10]
            return tens + "十" + ones
        }
    }

    static func pinyin(number: Int) -> String {
        let digits = ["", "yī", "èr", "sān", "sì", "wǔ", "liù", "qī", "bā", "jiǔ"]
        if number <= 10 {
            return number == 10 ? "shí" : digits[number]
        } else if number < 20 {
            return "shí " + digits[number % 10]
        } else {
            let tens = digits[number / 10]
            let ones = digits[number % 10]
            return tens + "shí" + ones
        }
    }
}
