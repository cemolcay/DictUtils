//
//  DictUtils.swift
//  DictUtils
//
//  Created by cem.olcay on 08/02/2019.
//  Copyright © 2019 cemolcay. All rights reserved.
//

import Foundation

/// Merges right hand side dictionary into left hand side dictionary. Works on nested dictionaries as well.
///
/// - Parameters:
///   - lhs: Dictionary you want to merge someting.
///   - rhs: Merging dictionary.
/// - Returns: Returns merged dictionary.
public func +<Key, Value> (lhs: [Key: Value], rhs: [Key: Value]) -> [Key: Value] {
  var result = lhs
  rhs.forEach {
    if let dict = $1 as? [Key: Value] {
      if let exist = result[$0] as? [Key: Value] {
        result[$0] = exist + dict as? Value
      } else {
        result[$0] = dict as? Value
      }
    } else {
      result[$0] = $1
    }
  }
  return result
}

/// Appends the right hand side dictionary. Works on nested dictionaries as well
///
/// - Parameters:
///   - lhs: Dictionary you want to merge someting.
///   - rhs: Merging dictionary.
public func +=<Key, Value> (lhs: inout [Key: Value], rhs: [Key: Value]) {
  // swiftlint:disable:next shorthand_operator
  lhs = lhs + rhs
}

extension Dictionary where Key == String {
  /// Returns the int value of the object with the key.
  ///
  /// - Parameter key: The key of the object you want to retrive.
  public subscript(int key: String) -> Int? {
    return self[key] as? Int
  }

  /// Returns the string value of the object with the key.
  ///
  /// - Parameter key: The key of the object you want to retrive.
  public subscript(string key: String) -> String? {
    return self[key] as? String
  }

  /// Returns the double value of the object with the key.
  ///
  /// - Parameter key: The key of the object you want to retrive.
  public subscript(int key: String) -> Double? {
    return self[key] as? Double
  }

  /// Returns the float value of the object with the key.
  ///
  /// - Parameter key: The key of the object you want to retrive.
  public subscript(float key: String) -> Float? {
    return self[key] as? Float
  }

  /// Returns the double value of the object with the key.
  ///
  /// - Parameter key: The key of the object you want to retrive.
  public subscript(double key: String) -> Double? {
    return self[key] as? Double
  }

  /// Returns the bool value of the object with the key.
  ///
  /// - Parameter key: The key of the object you want to retrive.
  public subscript(bool key: String) -> Bool? {
    return self[key] as? Bool
  }

  /// Returns the dictionary value of the object with the key.
  ///
  /// - Parameter key: The key of the object you want to retrive.
  public subscript(dict key: String) -> [String: Any]? {
    return self[key] as? [String: Any]
  }

  /// Returns the int value of the object with the key.
  ///
  /// - Parameter key: The key of the object you want to retrive.
  public subscript(intArray key: String) -> [Int]? {
    return self[key] as? [Int]
  }

  /// Returns the string array value of the object with the key.
  ///
  /// - Parameter key: The key of the object you want to retrive.
  public subscript(stringArray key: String) -> [String]? {
    return self[key] as? [String]
  }

  /// Returns the double array value of the object with the key.
  ///
  /// - Parameter key: The key of the object you want to retrive.
  public subscript(intArray key: String) -> [Double]? {
    return self[key] as? [Double]
  }

  /// Returns the float array value of the object with the key.
  ///
  /// - Parameter key: The key of the object you want to retrive.
  public subscript(floatArray key: String) -> [Float]? {
    return self[key] as? [Float]
  }

  /// Returns the double array value of the object with the key.
  ///
  /// - Parameter key: The key of the object you want to retrive.
  public subscript(doubleArray key: String) -> [Double]? {
    return self[key] as? [Double]
  }

  /// Returns the bool array value of the object with the key.
  ///
  /// - Parameter key: The key of the object you want to retrive.
  public subscript(boolArray key: String) -> [Bool]? {
    return self[key] as? [Bool]
  }

  /// Returns the dictionary value of the object with the key.
  ///
  /// - Parameter key: The key of the object you want to retrive.
  public subscript(dictArray key: String) -> [[String: Any]]? {
    return self[key] as? [[String: Any]]
  }
}

extension Dictionary {
  /// Creates a pretty printable string from the dictionary.
  ///
  /// - Returns: String value of the dictionary.
  public func prettify() -> String {
    do {
      let data = try JSONSerialization.data(withJSONObject: self, options: [.prettyPrinted])
      return String(data: data, encoding: .utf8) ?? ""
    } catch {
      return ""
    }
  }

  /// Initilizes the dictionary from a JSON string.
  ///
  /// - Parameter string: The JSON string you want to create a dictionary.
  public init(json string: String) {
    guard let data = string.data(using: .utf8),
      let json = (try? JSONSerialization.jsonObject(with: data, options: [])) as? Dictionary
      else { self = [:]; return }
    self = json
  }
}
