//
//  TodoViewModel.swift
//  ReduxTodoExample
//
//  Created by Karl Bowden on 20/12/2015.
//  Copyright © 2015 SwiftRedux. All rights reserved.
//

import Bond

struct TodoViewModel {
    let todos: ObservableArray<Todo>
    let createTodo: (name: String) -> ()

    init(todos: ObservableArray<Todo>, createTodo: String -> ()) {
        self.todos = todos
        self.createTodo = createTodo
    }
}
