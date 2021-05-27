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

    var cryptoDataMock: CryptoData!
    var mockSession: MockURLSession!

    override func setUp() {
        super.setUp()
        self.cryptoDataMock = CryptoData(data: [])
        self.mockSession = MockURLSession()
    }

    override func tearDown() {
        self.cryptoDataMock = nil
        self.mockSession = nil
        Mocks.tearDownMockFileForToday()
        super.tearDown()
    }

    func test_get_request_resumeWasCalled() {

        // given
        let expect = expectation(description: "Getting crypto")

        CurrencyService.request(session: mockSession) { _ in

            guard let dataTaskMock = self.mockSession.dataTask else {
                return XCTFail("Failed creating DataTaskMock")
            }

            XCTAssertEqual(dataTaskMock.calledResume, true)
            expect.fulfill()
        }
        wait(for: [expect], timeout: 5)
    }

    func test_request_completionDataIsNilErrorIsNil_returnIsNil() {
        // given
        mockSession.testData = nil
        mockSession.testError = nil
        let expect = expectation(description: "Data is NIL")

        // then
        CurrencyService.request(session: mockSession) { result in
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
        mockSession.testData = nil
        mockSession.testError = ErrorMock.mock
        let expect = expectation(description: "Data is NIL")

        // then
        CurrencyService.request(session: mockSession) { result in
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
        mockSession.testData = dataMock
        mockSession.testError = ErrorMock.mock

        let expect = expectation(description: "Data is NIL")

        // then
        CurrencyService.request(session: mockSession) { result in
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
        guard let dataMock = try? JSONEncoder().encode(cryptoDataMock) else {
            return XCTFail("Failed creating DataMock")
        }
        // when
        mockSession.testData = dataMock
        mockSession.testError = nil

        let expect = expectation(description: "Request sucess")

        //  then
        CurrencyService.request(session: mockSession) { result in
            switch result {
            case .success(let cryptocoinArray):
                XCTAssertEqual(cryptocoinArray, self.cryptoDataMock.data)
                expect.fulfill()
            case .failure:
                break
            }
        }

        wait(for: [expect], timeout: 5)
    }

    func test_currencyService_returnDecodeError() {

        // given
        let dataMock = "Not JSON".data(using: .utf8)
        // swiftlint:disable line_length
        let expectedErrorDescription = "dataCorrupted(Swift.DecodingError.Context(codingPath: [], debugDescription: \"The given data was not valid JSON.\", underlyingError: Optional(Error Domain=NSCocoaErrorDomain Code=3840 \"Invalid value around character 0.\" UserInfo={NSDebugDescription=Invalid value around character 0.})))"

        // when
        mockSession.testData = dataMock
        mockSession.testError = nil

        let expect = expectation(description: "Request sucess")

        //  then
        CurrencyService.request(session: mockSession) { result in
            switch result {
            case .failure(let error):
                XCTAssertEqual(
                    error as? CurrencyServiceError,
                    CurrencyServiceError.decodeError(errorDescription: expectedErrorDescription)
                )
                expect.fulfill()
            case .success:
                break
            }
        }

        wait(for: [expect], timeout: 5)
    }

    func test_gettingCryptocoins_returnFromReadFileURL() {

        // given
        Mocks.setUpMockFileForToday()
        let mockedJSON = Mocks.json

        let expect = expectation(description: "Read cryptoCoins from File")

        // when
        CurrencyService.gettingCryptocoins { cryptoCoinArray in
            // then
            XCTAssertEqual(mockedJSON.data, cryptoCoinArray)
            expect.fulfill()
        }

        wait(for: [expect], timeout: 3)
    }

    func test_gettingCryptocoins_returnFromRequest() {

        // given
        guard let dataMock = try? JSONEncoder().encode(cryptoDataMock) else {
            return XCTFail("Failed creating DataMock")
        }

        mockSession.testData = dataMock
        mockSession.testError = nil

        let expect = expectation(description: "Read cryptoCoins from Request")

        // when
        CurrencyService.gettingCryptocoins(session: mockSession) { cryptoCoinArray in

            // then
            XCTAssertEqual(cryptoCoinArray, self.cryptoDataMock.data)
            expect.fulfill()
        }

        wait(for: [expect], timeout: 3)
    }

    func test_gettingCryptocoins_returnErrorFromReadFile() {

        // given
        Mocks.setUpMockWrongFileForToday()

        let expect = expectation(description: "Failed Request")

        // when
        CurrencyService.gettingCryptocoins { cryptoCoinArray in

            // then
            XCTAssertEqual(cryptoCoinArray, [])
            expect.fulfill()
        }

        wait(for: [expect], timeout: 3)
    }

    func test_gettingCryptocoins_returnFailedRequest() {

        // given
        mockSession.testData = nil
        mockSession.testError = CurrencyServiceError.decodeError(errorDescription: "👺")
        let expectedCryptocoinArray: [CryptoCoin] = []

        let expect = expectation(description: "Data empty")

        // then
        CurrencyService.gettingCryptocoins(session: mockSession) { cryptoCoinArray in
            XCTAssertEqual(cryptoCoinArray, expectedCryptocoinArray)
            expect.fulfill()
        }

        wait(for: [expect], timeout: 5)
    }

}
