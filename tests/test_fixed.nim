import unittest2

import ../protobuf_serialization

type
  Float3Object {.proto3.} = object
    a {.fieldNumber: 1.}: float32

suite "Test Fixed Encoding/Decoding":
  test "Can encode/decode floats wrapped in an object":
    check:
      Protobuf.decode(
        Protobuf.encode(Float3Object(a: 5.64'f32)),
        Float3Object
      ).a == 5.64'f32
