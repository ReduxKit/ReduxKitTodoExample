//
//  LoggingMiddleware.swift
//  ReduxKitTodoExample
//
//  Created by Karl Bowden on 20/12/2015.
//  Copyright © 2015 ReduxKit. All rights reserved.
//

import ReduxKit

func loggingMiddleware<State>(store: Store<State>) -> DispatchTransformer {
    return { next in
        { action in
            print(action)
            return next(action)
        }
    }
}
