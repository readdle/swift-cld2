//
//  cld2SwiftTests.swift
//  cld2SwiftTests
//
//  Created by Yury on 10/18/17.
//  Copyright © 2017 yuryybk. All rights reserved.
//

import XCTest
@testable import RDCld2

class LanguageDetectionTests: XCTestCase {
    // swiftlint:disable line_length
    let test_be_Cyrl = " а друкаваць іх не было тэхнічна магчыма бліжэй за вільню тым самым часам нямецкае кіраўніцтва прапаноўвала апроч ўвядзення лацінкі яе"
    let test_bg_Cyrl = " а дума попада в състояние на изпитание ключовите думи с предсказана малко под то изискване на страниците за търсене в"
    let test_uk_Cyrl = " а більший бюджет щоб забезпечити собі максимум прибутків від переходів відстежуйте свої об яви за датою географічним розташуванням"
    let test_en_Latn = " a backup credit card by visiting your billing preferences page or visit the adwords help centre for more details https adwords google com support bin answer py answer hl en we were unable to process the payment of for your outstanding google adwords"
    let test_uk_Date = "18 бер. 2015 12:37, користувач \"Andery Andreev\" <andrey@andreev.com>"
    let test_en_Date = "On 31 January 2017 at 15:02, Lars Larsén"
    let test_sv_Date = "Från: Yukio Yukiosman [mailto:yukio.yukiosman@yukiosman.com]\nSkickat: den 31 januari 2017 08:49"
    let test_fr_Latn = "Si on peut faire les changements demain comme ça je pourrais faire tous les tests. Concrètement qu'est-ce que ça changera ?"
    let test_it_Latn = "Ciao,\n\nSpero tu stia bene! Ti andrebbe di incontrarci domani mattina per un caffè insieme? Avevo in mente di vederci alle 10:30 al nostro solito bar, quel posto accogliente dove ci piace trascorrere un po' di tempo a chiacchierare. Fammi sapere se ti è comodo e se sei disponibile, mi farebbe piacere passare un po' di tempo con te!\n\nA presto!"
    let test_ru_Cyrl = "Здравствуйте, спасибо большое за приглашение, но у меня не получится на 18:00, сможем ли мы перенести время?"
    // swiftlint:enable line_length
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBELanguage() {
        let result = LanguageDetector.detectLanguage(string: test_be_Cyrl, strict: false)
        XCTAssert(result.contains("be"))
    }
    
    func testBGLanguage() {
        let result = LanguageDetector.detectLanguage(string: test_bg_Cyrl, strict: false)
        XCTAssert(result.contains("bg"))
    }
    
    func testUKLanguage() {
        let result = LanguageDetector.detectLanguage(string: test_uk_Cyrl, strict: false)
        XCTAssert(result.contains("uk"))
    }
    
    func testENLanguage() {
        let result = LanguageDetector.detectLanguage(string: test_en_Latn, strict: false)
        XCTAssert(result.contains("en"))
    }
    
    func testUKDate() {
        let result = LanguageDetector.detectLanguage(string: test_uk_Date, strict: false)
        XCTAssert(result.contains("uk"))
    }
    
    func testENDate() {
        let result = LanguageDetector.detectLanguage(string: test_en_Date, strict: false)
        XCTAssert(result.contains("en"))
    }
    
    func testSVDate() {
        let result = LanguageDetector.detectLanguage(string: test_sv_Date, strict: false)
        XCTAssert(result.contains("sv"))
    }
    
    func testFRLanguage() {
        let result = LanguageDetector.detectLanguage(string: test_fr_Latn, strict: false)
        XCTAssert(result.contains("fr"))
    }

    func testITLanguage() {
        let result = LanguageDetector.detectLanguage(string: test_it_Latn, strict: false)
        XCTAssert(result.contains("it"))
    }

    func testRULanguage() {
        let result = LanguageDetector.detectLanguage(string: test_ru_Cyrl, strict: false)
        XCTAssert(result.contains("ru"))
    }
}
