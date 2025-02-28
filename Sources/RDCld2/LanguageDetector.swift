//
//  LanguageDetector.swift
//  cld2Swift
//
//  Created by Yury on 10/18/17.
//  Copyright © 2017 yuryybk. All rights reserved.
//

import Foundation

#if SWIFT_PACKAGE
import cld2
#endif

public struct LanguageDetectionResult {
    public let languages: [String]
    public let percents: [Int32]
    public let isReliable: Bool
}

public class LanguageDetector {

    public class func detectLanguage(string: String, strict: Bool = false) -> [String] {
        self.detectLanguage(string: string, strict: strict, isPlainText: false)?.languages ?? []
    }

    public class func fuzzyDetectLanguage(string: String, strict: Bool = false, isPlainText: Bool = false) -> String? {
        guard let result = self.detectLanguage(string: string, strict: strict, isPlainText: isPlainText) else {
            return nil
        }

        if result.languages.count >= 2, result.percents.count >= 2 {
            let lang1 = result.languages[0]
            let lang2 = result.languages[1]
            let lang2Score = result.percents[1]

            if lang1 == "en",
               self.isLatinBased(languageCode: lang2),
               lang2Score >= 50 {
                return lang2
            }
        }
        return result.languages.first
    }

    public class func detectLanguage(string: String, strict: Bool = false, isPlainText: Bool = false) -> LanguageDetectionResult? {
        guard let data = string.data(using: .utf8) else {
            assert(false)
            return nil
        }

        return data.withUnsafeBytes { (ptr: UnsafeRawBufferPointer) -> LanguageDetectionResult? in
            guard let dataPtr = ptr.bindMemory(to: Int8.self).baseAddress else {
                assert(false)
                return nil
            }

            let cResult = detectLanguages(dataPtr, Int32(data.count), strict ? 1 : 0, isPlainText ? 1 : 0)
            defer {
                CLanguageDetectionResultRelease(cResult)
            }
            var languages = [String]()
            var percents = [Int32]()
            for i in 0 ..< 3 {
                if let ptr = cResult.language3?[i] {
                    let lang = String(cString: ptr)
                    guard lang != "un" else {
                        // skip unknown language
                        continue
                    }
                    languages.append(lang)
                    percents.append(cResult.percent3[i])
                }
            }
            return LanguageDetectionResult(languages: languages, percents: percents, isReliable: cResult.is_reliable > 0)
        }
    }
    
    private class func isLatinBased(languageCode: String) -> Bool {
        return self.latinBasedLanguages.contains(languageCode)
    }

    private static let latinBasedLanguages: Set<String> = [
        "af", // Afrikaans
        "ast", // Asturian
        "eu", // Basque
        "br", // Breton
        "ca", // Catalan
        "ceb", // Cebuano
        "ch", // Chamorro
        "kw", // Cornish
        "co", // Corsican
        "cs", // Czech
        "da", // Danish
        "nl", // Dutch
        "en", // English
        "eo", // Esperanto
        "et", // Estonian
        "fo", // Faroese
        "fi", // Finnish
        "fr", // French
        "fy", // Frisian
        "gl", // Galician
        "de", // German
        "kl", // Greenlandic
        "hu", // Hungarian
        "is", // Icelandic
        "id", // Indonesian
        "ga", // Irish
        "it", // Italian
        "ku", // Kurdish (Latin)
        "la", // Latin
        "lv", // Latvian
        "lt", // Lithuanian
        "lb", // Luxembourgish
        "ms", // Malay
        "mt", // Maltese
        "gv", // Manx
        "no", // Norwegian
        "oc", // Occitan
        "pl", // Polish
        "pt", // Portuguese
        "ro", // Romanian
        "sco", // Scots
        "gd", // Scottish Gaelic
        "sk", // Slovak
        "sl", // Slovenian
        "es", // Spanish
        "sw", // Swahili
        "sv", // Swedish
        "tl", // Tagalog
        "tr", // Turkish
        "vi", // Vietnamese
        "cy", // Welsh
        "wa", // Walloon
    ]
}
