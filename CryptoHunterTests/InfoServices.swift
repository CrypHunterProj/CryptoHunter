//
//  InfoServices.swift
//  CryptoHunterTests
//
//  Created by Alley Pereira on 26/05/21.
//

import XCTest
@testable import CryptoHunter

class InfoServices: XCTestCase {

    var sut: InformationService!

    override func setUp() {
        super.setUp()
        self.sut = InformationService()
    }

    func test_getJsonURL_returnPath() throws {

        // given
        let filename: String = "Informacoes"

        // when
        let url = try XCTUnwrap(sut.getJsonURL(filename: filename))

        // then
        XCTAssertEqual(url.lastPathComponent, filename+".json")

    }

    func test_getJsonURL_returnNil() throws {

        // given
        let filename: String = "👺"

        // when
        let url = sut.getJsonURL(filename: filename)

        // then
        XCTAssertNil(url)

    }

    func test_ParseJson_returnEmptyArray() {

        // given
        let filename: String = "🥺"

        // when
        let informationArray = sut.parseJson(filename: filename)

        // then
        XCTAssert(informationArray.isEmpty)
    }

    func test_JsonData_returnInformationArray() {

        // given
        let filename: String = "Informacoes"

        // when
        let informationArray = sut.parseJson(filename: filename)

        // then
        XCTAssertFalse(informationArray.isEmpty)
    }

    func test_JsonData_returnInformationError() {

        // given
        let filename: String = "Coinmarketcap"

        // when
        let informationArray = sut.parseJson(filename: filename)

        // then
        XCTAssert(informationArray.isEmpty)
    }

}
