//
//  APIWrapper.swift
//  GW2Achievements
//
//  Created by Thibaut Coutard on 10/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

class APIWrapper: APIWrapperProtocol {
    var currentTask: URLSessionDataTask?

    func fetch(url: URL, success: @escaping (Data) -> Void, failure: @escaping (Error) -> Void) {

        self.currentTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                failure(error)
            }
            if let data = data {
                success(data)
            }
        }

        self.currentTask?.resume()
    }

    func cancel() {
        self.currentTask?.cancel()
    }
}
