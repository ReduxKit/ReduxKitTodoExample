//
//  AppState.swift
//  ReduxKitTodoExample
//
//  Created by Karl Bowden on 20/12/2015.
//  Copyright © 2015 ReduxKit. All rights reserved.
//

import Bond
import ReduxKit

// State typealias'
typealias AppStore = Store<AppState>
typealias Reducer = (previousState: AppState?, action: Action) -> AppState
typealias Subscriber = (updatedState: AppState) -> ()
typealias MiddlewareApi = AppStore
typealias Middleware = MiddlewareApi -> DispatchTransformer
typealias StoreCreator = (reducer: Reducer, initialState: AppState?) -> AppStore
typealias StoreEnhancer = (StoreCreator) -> StoreCreator
typealias AppStateStream = StateStream<AppState>
typealias StreamFactory = (initialState: AppState) -> AppStateStream


struct AppState {
    let todos: [Todo]
}


func applicationReducer(state: AppState? = nil, action: Action) -> AppState {
    return AppState(todos: todoReducer(state?.todos, action: action))
}
