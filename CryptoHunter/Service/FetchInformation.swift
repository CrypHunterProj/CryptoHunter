//
//  File.swift
//  CryptoHunter
//
//  Created by Alley Pereira on 14/05/21.
//

import Foundation

struct FetchInformation {

    // Pegando o caminho (path) do arquivo e transformar num objeto do tipo URL
    private func getJsonURL(filename: String) -> URL? {
        guard let path = Bundle.main.path(forResource: filename, ofType: "json") else {
                                          return nil
                                          }
        let url = URL(fileURLWithPath: path)
        print("Path: ", path)
        print("url: ", url)
        return url
    }

    func parseJson(filename: String) -> [InformationData] {

        guard let url = getJsonURL(filename: filename) else {
            return []
        }

        do {
            let jsonData = try Data(contentsOf: url)
            let information = try JSONDecoder().decode([InformationData].self, from: jsonData)
            return information

        } catch {
            print("Error \(error)")
            return []
        }
    }
}
