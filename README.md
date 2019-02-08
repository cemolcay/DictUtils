DictUtils
====

Adds bunch of extensions and operators that would make work with Dicitonaries easier. If you are working with JSON and don't want to use dependencies like SwiftyJSON and keep everything native, you can peacefully grab that little helper.

Requirements
----

* Xcode 10+
* Swift 4.0+
* iOS 8.0+
* tvOS 9.0+
* macOS 10.10+
* watchOS 2.0+

Install
---- 

#### Manually

* Copy the `DictUtils.swift` file into your codebase.

#### Cocoapods

```
pod 'DictUtils'
```

Extensions
-----

* `+` and `+=` operators
	* 	Merges two dictionaries without hassle.
	
* Typed, chainable subscripts
	* 	Get `int`, `string`, `bool`, `double`, `[String: Any]` and their array types.

``` swift
let index = dataSource[int: "index"]
let name = dataSource[string: "name"]
let zipCode = dataSource[dict: "users"]?[0][dict: "address"]?[string: "zip"]
```

* Initialize a dictionary from a JSON string.

```
let dict = [String: Any](json: response.string)
```

* Get pretty printed string with `dataSource.prettify()`.