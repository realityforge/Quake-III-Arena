# TODO

A list of actions that have become obvious when performing BAZEL build.

## Actions to Perform

## Actions to Perform Post Makefile Removal

Once the Makefile is no longer required, we can do the following:

* Use CURL library as per https://github.com/tensorflow/tensorflow/blob/master/third_party/curl.BUILD
* Use SIMD optimized jpeg library as per https://github.com/tensorflow/tensorflow/blob/master/third_party/jpeg/jpeg.BUILD
* Switch zlib as per https://github.com/tensorflow/tensorflow/blob/master/third_party/zlib.BUILD
* Add a local .bazelrc ... maybe inspired by https://github.com/tensorflow/tensorflow/blob/master/.bazelrc