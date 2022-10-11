//
//  RKLocalization.swift
//  NetFlix
//
//  Created by MAC on 10/10/22.
//

import UIKit

enum LanguageDirection : Int {
    case leftToRight = 1
    case rightToLeft = 2
}

class RKLocalization: NSObject {
    static let shared = RKLocalization()
    var bundle: Bundle? = nil
    var languageDirection = LanguageDirection(rawValue: 1)
    
    // Get direction of language
    func getlanguageDirection() -> LanguageDirection {
        if languageDirection?.rawValue == 0 {
            return .leftToRight
        }else if getLanguage() == "ar" {
            return .rightToLeft
        }else{
            return .leftToRight
        }
    }
    
    // get localizedString from bundle of selected language
    func localizedString(forKey key: String, value comment: String) -> String {
        let localized = bundle?.localizedString(forKey: key, value: comment, table: nil)
        return localized ?? ""
    }
    
    // set language for localization
    func setLanguage(language: String) -> Void {
        var selectedLanguage = language
        if language.count == 0 {
            selectedLanguage = "en"
        }
        UserDefaults.standard.set(selectedLanguage, forKey: "kLanguage")
        UserDefaults.standard.synchronize()
        let path: String? = Bundle.main.path(forResource: selectedLanguage, ofType: "lproj")
        print("asdadasd")
        print(path)
        if path == nil {
            //in case the language does not exists
            resetLocalization()
        }
        else {
            bundle = Bundle(path: path!)
        }
    }
    
    // reset bundle
    func resetLocalization() {
        bundle = Bundle.main
    }
    
    // get selected language from UserDefaults
    func getLanguage() -> String? {
        if let language = UserDefaults.standard.string(forKey: "kLanguage"){
            return language
        }
        return nil
    }
  
}

// LocalizedString to get string in selected language
func RKLocalizedString(key: Any, comment: Any) -> String {
    return RKLocalization.shared.localizedString(forKey: (key as! String), value: (comment as! String))
}


