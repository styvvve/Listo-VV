//
//  Environment.swift
//  Listo
//
//  Created by NGUELE Steve  on 25/01/2026.
//

import Foundation

enum Environment {
    static var supabaseURL: URL {
        guard let urlString = Bundle.main.infoDictionary?["SUPABASE_URL"] as? String, let url = URL(string: urlString) else {
            fatalError("SUPABASE_URL NOT FOUND")
        }
        return url
    }
    
    static var supabaseAnonKey: String {
        guard let key = Bundle.main.infoDictionary?["SUPABASE_ANON_KEY"] as? String else {
            fatalError("SUPABASE_ANON_KEY NOT FOUND")
        }
        return key
    }
}

#if DEBUG
extension Environment {
    static func debugPrintInfoPlist() {
        let dict = Bundle.main.infoDictionary ?? [:]
        print("Raw infoDictionary:", dict)

        if let urlString = dict["SUPABASE_URL"] as? String {
            print("SUPABASE_URL (String):", urlString)
        } else {
            print("SUPABASE_URL is missing or not a String")
        }

        if let anonKey = dict["SUPABASE_ANON_KEY"] as? String {
            print("SUPABASE_ANON_KEY (String):", anonKey)
        } else {
            print("SUPABASE_ANON_KEY is missing or not a String")
        }
    }
}
#endif
