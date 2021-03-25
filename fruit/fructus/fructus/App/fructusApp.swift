//
//  fructusApp.swift
//  fructus
//
//  Created by Syed ShahRukh Haider on 22/12/2020.
//

import SwiftUI

@main
struct fructusApp: App {
    
    
    @AppStorage("isOnboarding") var isBoarding = true
    
    var body: some Scene {
        WindowGroup {
            
            if isBoarding{
                OnboardingView()

            }else{
                ContentView()
            }
        }
    }
}
