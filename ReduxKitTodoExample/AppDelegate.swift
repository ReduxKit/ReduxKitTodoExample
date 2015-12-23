//
//  AppDelegate.swift
//  ReduxKitTodoExample
//
//  Created by Karl Bowden on 20/12/2015.
//  Copyright © 2015 ReduxKit. All rights reserved.
//

import UIKit
import ReduxKit
import Bond

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        let baseColor = UIColor(red: 0.25, green: 0.51, blue: 0.76, alpha: 1.0)
        UINavigationBar.appearance().translucent = false
        UINavigationBar.appearance().barStyle = .Black
        UINavigationBar.appearance().barTintColor = baseColor
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()

        let store = applyMiddleware([loggingMiddleware])(createStore)(applicationReducer, nil)

        let todoViewModel = TodoViewModel(
            todos: liftStream(store.subscribe) { $0.todos },
            createTodo: bindActionCreators(CreateTodoAction.self, dispatch: store.dispatch))

        let todoViewController = TodoViewController(viewModel: todoViewModel)

        let navigationController = UINavigationController(rootViewController: todoViewController)

        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        store.dispatch(CreateTodoAction(payload: "Initial Item 1"))
        store.dispatch(CreateTodoAction(payload: "Initial Item 2"))

        return true
    }
}
