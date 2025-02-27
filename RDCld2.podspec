Pod::Spec.new do |s|
  s.name         = "RDCld2"
  s.version      = "1.0.6"
  s.summary      = "Compact Language Detector 2"
  s.homepage     = "https://github.com/readdle/swift-cld2"
  s.license      = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }
  s.author       = { "Dick Sites" => "dsites@google.com" }
  s.source       = { :git => "git@github.com:readdle/swift-cld2.git", :tag => s.version.to_s }

  s.platforms    = { :ios => '10.0', :osx => '10.12' }

  s.source_files = 
    'Sources/RDCld2/LanguageDetector.swift',
    'Sources/cld2/include/compact_lang_det_c.h',
    'Sources/cld2/cld2tablesummary.h',
    'Sources/cld2/cldutil.h',
    'Sources/cld2/cldutil_shared.h',
    'Sources/cld2/compact_lang_det.h',
    'Sources/cld2/compact_lang_det_hint_code.h',
    'Sources/cld2/compact_lang_det_impl.h',
    'Sources/cld2/debug.h',
    'Sources/cld2/encodings.h',
    'Sources/cld2/fixunicodevalue.h',
    'Sources/cld2/generated_ulscript.h',
    'Sources/cld2/generated_language.h',
    'Sources/cld2/getonescriptspan.h',
    'Sources/cld2/integral_types.h',
    'Sources/cld2/lang_script.h',
    'Sources/cld2/langspan.h',
    'Sources/cld2/offsetmap.h',
    'Sources/cld2/port.h',
    'Sources/cld2/scoreonescriptspan.h',
    'Sources/cld2/stringpiece.h',
    'Sources/cld2/tote.h',
    'Sources/cld2/utf8acceptinterchange.h',
    'Sources/cld2/utf8prop_lettermarkscriptnum.h',
    'Sources/cld2/utf8repl_lettermarklower.h',
    'Sources/cld2/utf8scannot_lettermarkspecial.h',
    'Sources/cld2/utf8statetable.h',
    'Sources/cld2/cldutil.cc',
    'Sources/cld2/cldutil_shared.cc',
    'Sources/cld2/compact_lang_det.cc',
    'Sources/cld2/compact_lang_det_hint_code.cc',
    'Sources/cld2/compact_lang_det_impl.cc',
    'Sources/cld2/debug.cc',
    'Sources/cld2/fixunicodevalue.cc',
    'Sources/cld2/generated_entities.cc',
    'Sources/cld2/generated_language.cc',
    'Sources/cld2/generated_ulscript.cc',
    'Sources/cld2/getonescriptspan.cc',
    'Sources/cld2/lang_script.cc',
    'Sources/cld2/offsetmap.cc',
    'Sources/cld2/scoreonescriptspan.cc',
    'Sources/cld2/tote.cc',
    'Sources/cld2/utf8statetable.cc',
    'Sources/cld2/generated_distinct_bi_0.cc',
    'Sources/cld2/cld_generated_cjk_uni_prop_80.cc',
    'Sources/cld2/cld2_generated_cjk_compatible.cc',
    'Sources/cld2/cld_generated_cjk_delta_bi_4.cc',
    'Sources/cld2/cld2_generated_quadchrome_2.cc',
    'Sources/cld2/cld2_generated_deltaoctachrome.cc',
    'Sources/cld2/cld2_generated_distinctoctachrome.cc',
    'Sources/cld2/cld_generated_score_quad_octa_2.cc',
    'Sources/cld2/compact_lang_det_c.cc'

  s.public_header_files = 'Sources/cld2/include/compact_lang_det_c.h'

  s.compiler_flags = '-std=c++98'
end
