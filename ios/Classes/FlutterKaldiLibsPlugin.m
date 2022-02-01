#import "FlutterKaldiLibsPlugin.h"
#if __has_include(<flutter_kaldi_libs/flutter_kaldi_libs-Swift.h>)
#import <flutter_kaldi_libs/flutter_kaldi_libs-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_kaldi_libs-Swift.h"
#endif

@implementation FlutterKaldiLibsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterKaldiLibsPlugin registerWithRegistrar:registrar];
}
@end
