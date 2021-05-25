//
//  MockURLSession.swift
//  CryptoHunterTests
//
//  Created by Alley Pereira on 20/05/21.
//

import Foundation
@testable import CryptoHunter

class MockURLSession: URLSession {

    var testData: Data?
    var testError: Error?
    var testResponse: HTTPURLResponse?
    var dataTask: MockURLSessionDataTask?

    override init() { }

    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let testMock = TestMockData(data: testData, error: testError, response: testResponse)
        let newDataTask = MockURLSessionDataTask(mockData: testMock, completion: completionHandler)
        dataTask = newDataTask
        return newDataTask
    }

    override func dataTask(with url: URL) -> URLSessionDataTask {
        let testMock = TestMockData(data: testData, error: testError, response: testResponse)
        let newDataTask = MockURLSessionDataTask(mockData: testMock, completion: { _, _, _ in })
        dataTask = newDataTask
        return newDataTask
    }

    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let testMock = TestMockData(data: testData, error: testError, response: testResponse)
        let newDataTask = MockURLSessionDataTask(mockData: testMock, completion: completionHandler)
        dataTask = newDataTask
        return newDataTask
    }

    override func dataTask(with request: URLRequest) -> URLSessionDataTask {
        let testMock = TestMockData(data: testData, error: testError, response: testResponse)
        let newDataTask = MockURLSessionDataTask(mockData: testMock, completion: { _, _, _ in })
        dataTask = newDataTask
        return newDataTask
    }
}
