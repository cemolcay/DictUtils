//
//  DictUtilsTests.swift
//  DictUtilsTests
//
//  Created by cem.olcay on 08/02/2019.
//  Copyright © 2019 cemolcay. All rights reserved.
//

import XCTest
@testable import DictUtils

class DictUtilsTests: XCTestCase {
  var dict = [String: Any]()

  override func setUp() {
    dict = [
      "int": 1,
      "string": "str",
      "double": 1.0,
      "bool": true,
      "dict": [
        "int": 1,
        "string": "str",
        "double": 1.0,
        "bool": true,
        "dict": [
          "int": 1,
          "string": "str",
          "double": 1.0,
          "bool": true
        ]
      ],
      "intArray": [1, 2],
      "stringArray": ["str", "st"],
      "doubleArray": [1.0, 2.0],
      "boolArray": [true, false],
      "dictArray": [
        [
          "int": 1,
          "string": "str",
          "double": 1.0,
          "bool": true,
          "dict": [
            "int": 1,
            "string": "str",
            "double": 1.0,
            "bool": true
          ]
        ],
        [
          "int": 1,
          "string": "str",
          "double": 1.0,
          "bool": true,
          "dict": [
            "int": 1,
            "string": "str",
            "double": 1.0,
            "bool": true
          ]
        ]
      ]
    ]
  }

  func testInt() {
    XCTAssertEqual(dict[int: "int"], 1)
  }

  func testString() {
    XCTAssertEqual(dict[string: "string"], "str")
  }

  func testBool() {
    XCTAssertEqual(dict[bool: "bool"], true)
  }

  func testDouble() {
    XCTAssertEqual(dict[double: "double"], 1.0)
  }

  func testDict() {
    XCTAssertEqual(dict[dict: "dict"]?[int: "int"], 1)
  }

  func testIntArray() {
    XCTAssertEqual(dict[intArray: "intArray"], [1, 2])
  }

  func testStringArray() {
    XCTAssertEqual(dict[stringArray: "stringArray"], ["str", "st"])
    XCTAssertEqual(dict[stringArray: "stringArray"]?[1], "st")
  }

  func testBoolArray() {
    XCTAssertEqual(dict[boolArray: "boolArray"], [true, false])
  }

  func testDoubleArray() {
    XCTAssertEqual(dict[doubleArray: "doubleArray"], [1.0, 2.0])
  }

  func testDictArray() {
    XCTAssertEqual(dict[dictArray: "dictArray"]?.count, 2)
    XCTAssertEqual(dict[dictArray: "dictArray"]?[1][dict: "dict"]?[int: "int"], 1)
  }
}
