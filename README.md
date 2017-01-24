# BeerList

List for different beers and types API [currently offline]:
https://www.ratebeer.com/json/ratebeer-api.asp

List for all the different countries:
let countries = NSLocale.isoCountryCodes.map { (code:String) -> String in
    let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
    return NSLocale(localeIdentifier: "en_US").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
}


