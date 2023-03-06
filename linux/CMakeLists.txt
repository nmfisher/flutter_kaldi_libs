# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

# Project-level configuration.
set(PROJECT_NAME "flutter_kaldi_libs")
project(${PROJECT_NAME} LANGUAGES CXX)

# This value is used when generating builds using this plugin, so it must
# not be changed.
set(PLUGIN_NAME "flutter_kaldi_libs_plugin")

# Define the plugin library target. Its name must not be changed (see comment
# on PLUGIN_NAME above).
#
# Any new source files that you add to the plugin should be added here.
add_library(${PLUGIN_NAME} SHARED
  "flutter_kaldi_libs_plugin.cc"
)

# Apply a standard set of build settings that are configured in the
# application-level CMakeLists.txt. This can be removed for plugins that want
# full control over build settings.
apply_standard_settings(${PLUGIN_NAME})

# Symbols are hidden by default to reduce the chance of accidental conflicts
# between plugins. This should not be removed; any symbols that should be
# exported should be explicitly exported with the FLUTTER_PLUGIN_EXPORT macro.
set_target_properties(${PLUGIN_NAME} PROPERTIES
  CXX_VISIBILITY_PRESET hidden)
target_compile_definitions(${PLUGIN_NAME} PRIVATE FLUTTER_PLUGIN_IMPL)

# Source include directories and library dependencies. Add any plugin-specific
# dependencies here.
target_include_directories(${PLUGIN_NAME} INTERFACE
  "${CMAKE_CURRENT_SOURCE_DIR}/include")
target_link_libraries(${PLUGIN_NAME} PRIVATE flutter)
target_link_libraries(${PLUGIN_NAME} PRIVATE PkgConfig::GTK)

# List of absolute paths to libraries that should be bundled with the plugin.
# This list could contain prebuilt libraries, or libraries created by an
# external build triggered from this build file.
set(flutter_kaldi_libs_bundled_libraries
  "${CMAKE_CURRENT_SOURCE_DIR}/../linux/lib/kaldi-fstext.a"
  "${CMAKE_CURRENT_SOURCE_DIR}/../linux/lib/kaldi-fstext.a"
  "${CMAKE_CURRENT_SOURCE_DIR}/../linux/lib/kaldi-chain.a"
  "${CMAKE_CURRENT_SOURCE_DIR}/../linux/lib/kaldi-nnet3.a"
  "${CMAKE_CURRENT_SOURCE_DIR}/../linux/lib/kaldi-online2.a"
  "${CMAKE_CURRENT_SOURCE_DIR}/../linux/lib/kaldi-feat.a"
  "${CMAKE_CURRENT_SOURCE_DIR}/../linux/lib/kaldi-ivector.a"
  "${CMAKE_CURRENT_SOURCE_DIR}/../linux/lib/kaldi-rnnlm.a"
  "${CMAKE_CURRENT_SOURCE_DIR}/../linux/lib/kaldi-lm.a"
  "${CMAKE_CURRENT_SOURCE_DIR}/../linux/lib/kaldi-decoder.a"
  "${CMAKE_CURRENT_SOURCE_DIR}/../linux/lib/kaldi-lat.a"
  "${CMAKE_CURRENT_SOURCE_DIR}/../linux/lib/kaldi-hmm.a"
  "${CMAKE_CURRENT_SOURCE_DIR}/../linux/lib/kaldi-transform.a"
  "${CMAKE_CURRENT_SOURCE_DIR}/../linux/lib/kaldi-gmm.a"
  "${CMAKE_CURRENT_SOURCE_DIR}/../linux/lib/kaldi-tree.a"
  "${CMAKE_CURRENT_SOURCE_DIR}/../linux/lib/kaldi-cudamatrix.a"
  "${CMAKE_CURRENT_SOURCE_DIR}/../linux/lib/kaldi-matrix.a"
  "${CMAKE_CURRENT_SOURCE_DIR}/../linux/lib/kaldi-util.a"
  "${CMAKE_CURRENT_SOURCE_DIR}/../linux/lib/kaldi-base.a"
  "${CMAKE_CURRENT_SOURCE_DIR}/../linux/lib/libopenblas.a"
  "${CMAKE_CURRENT_SOURCE_DIR}/../linux/lib/libclapack.a"
  "${CMAKE_CURRENT_SOURCE_DIR}/../linux/lib/liblapack.a"
  "${CMAKE_CURRENT_SOURCE_DIR}/../linux/lib/libblas.a"
  "${CMAKE_CURRENT_SOURCE_DIR}/../linux/lib/libf2c.a"
  "${CMAKE_CURRENT_SOURCE_DIR}/../linux/lib/libfst.a"
  "${CMAKE_CURRENT_SOURCE_DIR}/../linux/lib/ngram-fst.a"
  "${CMAKE_CURRENT_SOURCE_DIR}/../linux/lib/libfstngram.a"
  "${CMAKE_CURRENT_SOURCE_DIR}/../linux/lib/olabel_lookahead-fst.a"
  "${CMAKE_CURRENT_SOURCE_DIR}/../linux/lib/libfstlookahead.a"
  PARENT_SCOPE
)
