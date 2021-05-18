//
//  CurrentService.swift
//  CryptoHunter
//
//  Created by Alley Pereira on 18/05/21.
//

import Foundation

struct CoinMarketCapRouter {

    private init() { }

    static var urlRequest: URLRequest {
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = header
        return request
    }

    private static let url: URL = URL(
        string: "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=100&convert=BRL"
    )!

    private static var header: [String : String] {
        switch self {
        default:
            return [
                "Accepts": "application/json",
                "X-CMC_PRO_API_KEY": "89fe9de0-0581-4265-812e-84c7e2b2f59a",
            ]
        }
    }
}

struct CurrencyService {

    /// Função que abstrai a lógica que lê e retorna o array de CryptoCoin. Caso já tenha feito a requisição do dia atual, pega da persistencia. Se não, faz a requisição, persiste o resultado e retorna os dados baixados.
    /// - Parameters:
    ///     - completion: Retorna o array de CryptoCoin em uma closure
    ///     - cryptoCoinArray: Array contendo as informações das criptomoedas
    static func gettingCryptocoins(completion: @escaping (_ cryptoCoinArray: [CryptoCoin]) -> Void) {
        if hasPersistedCryptocoinsForToday() {
            let readDocumentsURL = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask).first!
            let readFileURL = readDocumentsURL.appendingPathComponent(gettingListingFilename())
            do {
                let data = try Data(contentsOf: readFileURL)
                let cryptoData = try JSONDecoder().decode(CryptoData.self, from: data)
                completion(cryptoData.data)
            } catch {
                print(error)
                completion([])
            }
        } else {
            request { result in
                switch result {
                case .success(let cryptocoin):
                    completion(cryptocoin)
                case .failure(let error):
                    print(error)
                    completion([])
                }
            }
        }
    }

    /// Verifica se há um arquivo persistido no dia e retorna um booleano
    private static func hasPersistedCryptocoinsForToday() -> Bool {
        //Gerando caminho para o arquivo do dia atual
        let documentsURL: URL = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask).first!
        let fileURL: URL = documentsURL.appendingPathComponent(gettingListingFilename())
        let filePath: String = fileURL.relativePath

        return FileManager.default.fileExists(atPath: filePath)
    }

    private static func request(session: URLSession = URLSession.shared,
                                completion: @escaping (Result<[CryptoCoin],Error>) -> Void) {

        let task = session.dataTask(with: CoinMarketCapRouter.urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(CurrencyServiceError.dataIsNil))
                return
            }

            do {
                let cryptoData = try JSONDecoder().decode(CryptoData.self, from: data)
                completion(.success(cryptoData.data))
                try persistListingsCurrency(data: data)
            }
            catch {
                completion(.failure(CurrencyServiceError.decodeError(errorDescription: "\(error)")))
            }
        }
        task.resume()
    }


    /// Salva no dispositivo o `data` do `CryptoData` para o dia atual. Usada dentro da função `request`.
    /// - Parameter data: Data do json que foi retornado na requisicao.
    /// - Throws: Erro que o data.write lança.
    private static func persistListingsCurrency(data: Data) throws {
        //Gerando caminho para o arquivo do dia atual
        let documentsURL: URL = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask).first!
        let fileURL: URL = documentsURL.appendingPathComponent(gettingListingFilename())

        //Persistindo data no caminho
        try data.write(to: fileURL)
    }


    /// Função que retorna o titulo padronizado pra que o nome do arquivo persistido seja unico por dia e identifique o dia atual. Dessa forma, todos os dias, o titulo do arquivo do dia atual é diferente do dia anterior.
    /// - Returns: Titulo do arquivo para o dia atual diferente do dia anterior.
    ///
    /// Exemplo de retorno:
    ///     "19-04-2021_ListingsCryptocurrency.json"
    ///
    private static func gettingListingFilename() -> String {
        let dateComponents = Calendar.current.dateComponents([ .day, .month, .year ], from: Date())
        let dateListeningCurrency: String = "\(dateComponents.day!)-\(dateComponents.month!)-\(dateComponents.year!)_ListingsCryptocurrency.json"
        return dateListeningCurrency
    }
}
