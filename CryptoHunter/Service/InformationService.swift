//
//  File.swift
//  CryptoHunter
//
//  Created by Alley Pereira on 14/05/21.
//

import Foundation

struct InformationService {

    private func getJsonURL(filename: String) -> URL? {
        guard let path = Bundle.main.path(forResource: filename, ofType: "json") else {
                                          return nil
                                          }
        let url = URL(fileURLWithPath: path)
        return url
    }

    func parseJson(filename: String) -> [Information] {

        guard let url = getJsonURL(filename: filename) else {
            return []
        }

        do {
            let jsonData = try Data(contentsOf: url)
            let information = try JSONDecoder().decode([Information].self, from: jsonData)
            return information

        } catch {
            print("Error \(error)")
            return []
        }
    }
}
