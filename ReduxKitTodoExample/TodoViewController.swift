//
//  TodoViewController.swift
//  ReduxKitTodoExample
//
//  Created by Karl Bowden on 20/12/2015.
//  Copyright © 2015 ReduxKit. All rights reserved.
//

import UIKit

class TodoViewController: UITableViewController {

    let viewModel: TodoViewModel

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(viewModel: TodoViewModel) {
        self.viewModel = viewModel
        super.init(style: .Plain)

        title = "Todos"

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Create", style: .Plain, target: self, action: "didClickCreate:")

        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        viewModel.todos.lift().bindTo(tableView) { indexPath, dataSource, tableView in
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
            let todo = dataSource[indexPath.section][indexPath.row]
            cell.textLabel?.text = todo.name
            return cell
        }
    }

    func didClickCreate(sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Create", message: "Create a new todo item", preferredStyle: .Alert)

        alertController.addTextFieldWithConfigurationHandler() { textField in
            textField.placeholder = "Name"
        }

        alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel) {_ in})

        alertController.addAction(UIAlertAction(title: "Create", style: .Default) { [unowned self] action in
            guard let textField = alertController.textFields?.first else { return }
            guard let name = textField.text else { return }

            self.viewModel.createTodo(name: name)
        })

        presentViewController(alertController, animated: true, completion: nil)
    }
}
