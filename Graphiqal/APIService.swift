//
//  APIService.swift
//  Graphiqal
//
//  Created by Artem Adams on 30.04.21.
//

import Foundation
import Apollo

class APIService: ObservableObject {

    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://graphql.anilist.co")!)

    private var setupCompleted: Bool = false

    func setup() {
        guard !setupCompleted else { return }

        apollo.fetch(query: ExampleQuery(id: 1)) { result in
          switch result {
          case .success(let graphQLResult):
            print("Success! Result: \(graphQLResult)")
          case .failure(let error):
            print("Failure! Error: \(error)")
          }
        }

        setupCompleted = true
    }

    // MARK: API

    func compare(candidate: String) {

    }

    // MARK: File Helper

    private func createCodes(data: Data) {

    }
}
