//
//  AuthenticationReducer.swift
//  SwiftFlowGitHubBrowser
//
//  Created by Benji Encz on 1/5/16.
//  Copyright © 2016 Benji Encz. All rights reserved.
//

import Foundation
import ReSwift
import OctoKit

func authenticationReducer(state: AuthenticationState?, action: Action) -> AuthenticationState {
    var state = state ?? initialAuthenticationState()

    switch action {
    case _ as SwiftFlowInit:
        break
    case let action as SetOAuthURL:
        state.oAuthURL = action.oAuthUrl
    case let action as UpdateLoggedInState:
        state.loggedInState = action.loggedInState
    default:
        break
    }

    return state
}

func initialAuthenticationState() -> AuthenticationState {
    let config = OAuthConfiguration(
        token: gitHubToken,
        secret: gitHubSecret,
        scopes: ["repo", "read:org"]
    )

    let initialState = AuthenticationState(
        oAuthConfig: config,
        oAuthURL: nil,
        loggedInState: .NotLoggedIn
    )

    return initialState
}