# Compact Language Detector 2

Fork of the [cld2](https://github.com/CLD2Owners/cld2) framework. Read about details in the original [cld2 summary](https://github.com/CLD2Owners/cld2).

## What is different?

- Added some tweaks to **not exclude detected languages with low probability rate** from the final result (see commits history). Introduced `strict_mode` parameter.  
- Added [C-wrapper](https://github.com/readdle/swift-cld2/blob/main/Source/cld2/compact_lang_det_c.cc#L13) for [DetectLanguageSummary()](https://github.com/readdle/swift-cld2/blob/main/Source/cld2/compact_lang_det.h#L187).
- Added [Swift-wrapper](https://github.com/readdle/swift-cld2/blob/main/Source/RDCld2/LanguageDetector.swift#L14) for C-wrapper for DetectLanguageSummary().

## License

This project is licensed under the Apache 2.0 - see the [LICENSE.md](LICENSE.md) file for details



