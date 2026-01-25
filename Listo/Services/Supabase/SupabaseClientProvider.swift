//
//  SupabaseClientProvider.swift
//  Listo
//
//  Created by NGUELE Steve  on 24/01/2026.
//

import Supabase
import Foundation


class SupabaseClientProvider {
    static let shared = SupabaseClientProvider()
    
    let client: SupabaseClient
    
    private init() {
        self.client = SupabaseClient(
            supabaseURL: Environment.supabaseURL,
            supabaseKey: Environment.supabaseAnonKey
        )
    }
}
