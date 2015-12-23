//
//  LiftStream.swift
//  ReduxKitTodoExample
//
//  Created by Karl Bowden on 20/12/2015.
//  Copyright © 2015 ReduxKit. All rights reserved.
//

import Bond
import ReduxKit

func liftStream<Item>(subscribe: Subscriber -> ReduxDisposable, source: AppState -> [Item]) -> ObservableArray<Item> {

    let stream = ObservableArray<Item>()

    subscribe { state in
        // TODO: Improve handling to detect differences between array states
        stream.removeAll()
        stream.extend(source(state))
    }

    return stream
}
