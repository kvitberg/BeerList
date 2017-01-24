# BeerList

<img width="318" alt="screen shot 2017-01-24 at 21 21 32" src="https://cloud.githubusercontent.com/assets/3436849/22265475/818fbaf6-e27c-11e6-992c-2bbbdeb06531.png">
<img width="319" alt="screen shot 2017-01-24 at 22 48 36" src="https://cloud.githubusercontent.com/assets/3436849/22268307/5549b55e-e287-11e6-898d-9bd9dc2b0b7a.png">

[List for different beers and types API [currently offline]](https://www.ratebeer.com/json/ratebeer-api.asp)

List for all the different countries:
```swift
let countries = NSLocale.isoCountryCodes.map { (code:String) -> String in
    let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
    return NSLocale(localeIdentifier: "en_US").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
}

```


