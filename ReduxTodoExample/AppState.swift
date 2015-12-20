//
//  AppState.swift
//  ReduxTodoExample
//
//  Created by Karl Bowden on 20/12/2015.
//  Copyright © 2015 SwiftRedux. All rights reserved.
//

import Bond
import Redux

// State typealias'
typealias Store = Redux.Store<State>
typealias Reducer = (previousState: State?, action: Action) -> State
typealias Subscriber = (updatedState: State) -> ()
typealias MiddlewareApi = Store
typealias Middleware = MiddlewareApi -> DispatchTransformer
typealias StoreCreator = (reducer: Reducer, initialState: State?) -> Store
typealias StoreEnhancer = (StoreCreator) -> StoreCreator
typealias StateStream = Redux.StateStream<State>
typealias StreamFactory = (initialState: State) -> StateStream


struct State {
    let todos: [Todo]
}


func reducer(state: State? = nil, action: Action) -> State {
    return State(todos: todoReducer(state?.todos, action: action))
}
