//
//  TodoState.swift
//  ReduxTodoExample
//
//  Created by Karl Bowden on 20/12/2015.
//  Copyright © 2015 SwiftRedux. All rights reserved.
//

import Redux

struct Todo {
    let name: String
    let done: Bool
}

struct CreateTodoAction: StandardAction {
    let meta: Any?
    let error: Bool
    let rawPayload: String

    init(payload: String? = nil, meta: Any? = nil, error: Bool = false) {
        self.rawPayload = payload ?? ""
        self.meta = meta
        self.error = error
    }
}

func todoReducer(previousTodos: [Todo]?, action: Action) -> [Todo] {
    let todos = previousTodos ?? []
    switch action {
    case let action as CreateTodoAction:
        return todos + [Todo(name: action.rawPayload, done: false)]
    default:
        return todos
    }
}
