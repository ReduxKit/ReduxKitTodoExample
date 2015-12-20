//
//  LoggingMiddleware.swift
//  ReduxTodoExample
//
//  Created by Karl Bowden on 20/12/2015.
//  Copyright © 2015 SwiftRedux. All rights reserved.
//

import Redux

func loggingMiddleware<State>(store: Redux.Store<State>) -> DispatchTransformer {
    return { next in
        { action in
            print(action)
            return next(action)
        }
    }
}
