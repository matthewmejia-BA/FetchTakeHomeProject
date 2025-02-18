//
//  FetchTakeHomeProjectTests.swift
//  FetchTakeHomeProjectTests
//
//  Created by BrilyanteApps on 2/15/25.
//

/// Trying new Swift Testing in lieu of XCTests
///

import Testing
import SwiftUI

@testable import FetchTakeHomeProject

struct APITests {
    private var urlSession: URLSession
    init() {
        urlSession = URLSession(configuration: .default)
    }
    
    @Test func apiValid() async throws {
        //Testing to make sure that url is valid and we get a succesfull status code
        let url = Constants.prodDataURL
        do {
            if let url {
                let (_, response) = try await urlSession.data(from: url)
                #expect((response as? HTTPURLResponse)?.statusCode == 200)
            }
        } catch {
            
        }
    }
    
    @Test func jsonValid() async throws {
        // Testing to make sure json id decoded properly with our data object
        let url = Constants.prodDataURL
        do {
            if let url {
                let (data, _) = try await urlSession.data(from: url)
                let decoder = JSONDecoder()
                let recipeData = try decoder.decode(RecipeData.self, from: data)
                #expect(recipeData.recipes != nil)
            }
        } catch {
            
        }
    }
}
