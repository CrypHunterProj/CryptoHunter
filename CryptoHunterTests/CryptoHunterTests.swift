//
//  CryptoHunterTests.swift
//  CryptoHunterTests
//
//  Created by Albert on 12/05/21.
//

import XCTest
@testable import CryptoHunter

enum ErrorMock: Error {
    case mock
}

class CryptoHunterTests: XCTestCase {

    func test_get_request_resumeWasCalled() {

        // given
        let mockSession = MockURLSession()

        let expect = expectation(description: "Getting crypto")

        CurrencyService.request(session: mockSession) { _ in

            guard let dataTaskMock = mockSession.dataTask else {
                return XCTFail("Failed creating DataTaskMock")
            }

            XCTAssertEqual(dataTaskMock.calledResume, true)
            expect.fulfill()
        }
        wait(for: [expect], timeout: 5)
    }

    func test_request_completionDataIsNilErrorIsNil_returnIsNil() {
        // given
        let session = MockURLSession()
        session.testData = nil
        session.testError = nil
        let expect = expectation(description: "Data is NIL")

        // then
        CurrencyService.request(session: session) { result in
            switch result {
            case .failure(let error):
                XCTAssertEqual(error as? CurrencyServiceError, CurrencyServiceError.dataIsNil)
                expect.fulfill()
            default:
                break
            }
        }

        wait(for: [expect], timeout: 5)
    }

    func test_request_completionDataIsNilErrorIsNotNil_returnIsNil() {
        // given
        let session = MockURLSession()
        session.testData = nil
        session.testError = ErrorMock.mock
        let expect = expectation(description: "Data is NIL")

        // then
        CurrencyService.request(session: session) { result in
            switch result {
            case .failure(let error):
                XCTAssertEqual(error as? CurrencyServiceError, CurrencyServiceError.dataIsNil)
                expect.fulfill()
            default:
                break
            }
        }

        wait(for: [expect], timeout: 5)
    }

    func test_request_completionDataIsNotNilErrorIsNotNil_returnIsNil() {
        // given
        guard let dataMock = try? JSONEncoder().encode(CryptoData(data: [])) else {
            return XCTFail("Failed creating DataMock")
        }

        // when
        let session = MockURLSession()
        session.testData = dataMock
        session.testError = ErrorMock.mock

        let expect = expectation(description: "Data is NIL")

        // then
        CurrencyService.request(session: session) { result in
            switch result {
            case .failure(let error):
                XCTAssertEqual(error as? CurrencyServiceError, CurrencyServiceError.dataIsNil)
                expect.fulfill()
            default:
                break
            }
        }

        wait(for: [expect], timeout: 5)
    }

    func test_currencyService_returnsSucess() {

        // given
        let cryptoDataMock = CryptoData(data: [])
        guard let dataMock = try? JSONEncoder().encode(cryptoDataMock) else {
            return XCTFail("Failed creating DataMock")
        }
        // when
        let session = MockURLSession()
        session.testData = dataMock
        session.testError = nil

        let expect = expectation(description: "Request sucess")

        //  then
        CurrencyService.request(session: session) { result in
            switch result {
            case .success(let cryptocoinArray):
                XCTAssertEqual(cryptocoinArray, cryptoDataMock.data)
                expect.fulfill()
            case .failure(_):
                break
            }
        }

        wait(for: [expect], timeout: 5)
    }

    func test_currencyService_returnDecodeError() {

        // given
        let dataMock = "Not JSON".data(using: .utf8)
        //swiftlint:disable line_length
        let expectedErrorDescription = "dataCorrupted(Swift.DecodingError.Context(codingPath: [], debugDescription: \"The given data was not valid JSON.\", underlyingError: Optional(Error Domain=NSCocoaErrorDomain Code=3840 \"Invalid value around character 0.\" UserInfo={NSDebugDescription=Invalid value around character 0.})))"

        // when
        let session = MockURLSession()
        session.testData = dataMock
        session.testError = nil

        let expect = expectation(description: "Request sucess")

        //  then
        CurrencyService.request(session: session) { result in
            switch result {
            case .failure(let error):
                XCTAssertEqual(
                    error as? CurrencyServiceError,
                    CurrencyServiceError.decodeError(errorDescription: expectedErrorDescription)
                )
                expect.fulfill()
            case .success(_):
                break
            }
        }

        wait(for: [expect], timeout: 5)
    }
}
