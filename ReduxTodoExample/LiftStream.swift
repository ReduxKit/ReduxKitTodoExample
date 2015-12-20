//
//  LiftStream.swift
//  ReduxTodoExample
//
//  Created by Karl Bowden on 20/12/2015.
//  Copyright © 2015 SwiftRedux. All rights reserved.
//

import Redux
import Bond

func liftStream<Item>(subscribe: Subscriber -> ReduxDisposable, source: State -> [Item]) -> ObservableArray<Item> {

    let stream = ObservableArray<Item>()

    subscribe { state in
        // TODO: Improve handling to detect differences between array states
        stream.removeAll()
        stream.extend(source(state))
    }

    return stream
}
