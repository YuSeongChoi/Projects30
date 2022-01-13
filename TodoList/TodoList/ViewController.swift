//
//  ViewController.swift
//  TodoList
//
//  Created by Mac on 2022/01/13.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var tasks = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    @IBAction func tapEditButton(_ sender: Any) {
        
    }
    
    @IBAction func tapAddButton(_ sender: Any) {
        let alert = UIAlertController(title: "할 일 등록", message: nil, preferredStyle: .alert)
        // 강한 순환 참조 : ARC의 단점, 2개의 객체가 상호 참조하는 경우 강한 순환 참조가 발생.
        // 레퍼런스 카운트가 0에 도달하지 않게 되고 메모리 누수가 발생 !!
        // 클로저의 선언부에서 캡처 목록을 정의함으로 해결 (weak, unknown)
        let registerButton = UIAlertAction(title: "등록", style: .default) { [weak self] _ in
            guard let title = alert.textFields?[0].text else { return }
            let task = Task(title: title, done: false)
            self?.tasks.append(task)
            self?.tableView.reloadData()
        }
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(registerButton)
        alert.addAction(cancelButton)
        alert.addTextField { textField in
            textField.placeholder = "할 일을 입력해주세요."
        }
        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let task = self.tasks[indexPath.row]
        cell.textLabel?.text = task.title
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
}
