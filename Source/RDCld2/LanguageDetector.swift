//
//  LanguageDetector.swift
//  cld2Swift
//
//  Created by Yury on 10/18/17.
//  Copyright © 2017 yuryybk. All rights reserved.
//

import Foundation
import cld2

public class LanguageDetector {
    
    public class func detectLanguage(string: String, strict: Bool = false) -> [String] {
        guard let data = string.data(using: .utf8) else {
            assert(false)
            return []
        }
        
        return data.withUnsafeBytes {
            guard let dataPtr = $0.bindMemory(to: Int8.self).baseAddress else {
                assert(false)
                return []
            }
            
            let langPtrs = detectLanguages(dataPtr, Int32(data.count), strict ? 1 : 0)
            defer {
                releaseLanguages(langPtrs)
            }
            
            var result = [String]()
            
            for i in 0 ..< 3 {
                if let ptr = langPtrs?[i] {
                    let lang = String(cString: ptr)
                    if lang != "un" {
                        result.append(lang)
                    }
                }
            }
            
            return result
        }
    }
    
}
