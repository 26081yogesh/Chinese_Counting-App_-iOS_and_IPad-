
import Foundation

@Observable
@MainActor
class StartupViewModel {
    var proverbModel: ProverbModel?

    var isLoading = false
    var navigateToGame = false

    private let urlString = "https://chinese-proverbs.onrender.com/api/proverbs/random"

    func fetchQuotes() async {
        isLoading = true
        defer { isLoading = false }

        guard let url = URL(string: urlString) else {
            proverbModel = ProverbModel.defaultQuote()
            print("Invalid URL, using default quote")
            return
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid Status Code - \(String(describing: (response as? HTTPURLResponse)?.statusCode))")
                return
            }

            let newProverbModel = try JSONDecoder().decode(ProverbModel.self, from: data)
            proverbModel = newProverbModel
        } catch {
            print("Failed to fetch quote, using default. Error - \(error)")
        }
    }
}
