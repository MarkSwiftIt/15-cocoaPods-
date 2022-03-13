//
//  ViewController.swift
//  15(CocoaPods)
//
//  Created by Mark Goncharov on 07.02.2022.
//

import UIKit
import SnapKit



class TableViewCell: UITableViewCell {
    static let identifier: String = "test identifier"

    var title: UILabel!
    var publishedAt: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configure()
        self.configureTwo()
    }

    func configure() {
        title = UILabel(frame: .zero)
        title.font = UIFont(name: title.font.fontName, size: 30)
        self.contentView.addSubview(title)
        title.snp.makeConstraints {
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-10)
            $0.top.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-50)
        }
    }
    func configureTwo() {
        publishedAt = UILabel(frame: .zero)
        self.contentView.addSubview(publishedAt)
        publishedAt.snp.makeConstraints {
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-10)
            $0.top.equalToSuperview().offset(50)
            $0.bottom.equalToSuperview().offset(-20)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController {
    var data: [String] = [
        "Jonh",
        "James",
        "Kate"
    ]
    var sms: [String] = [
        "Hi, how are you?",
        "WHY?",
        "What are you doing?"
    ]
        
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "SMS"
        tableView = UITableView(frame: .zero)
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self

        tableView.estimatedRowHeight = 150
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> Int {
        return sms.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        cell.title.text = data[indexPath.item]
        cell.publishedAt.text = sms[indexPath.item]
        return cell
    }
}




//func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return datesFromDictionary[section].nameSection
//    }
//func numberOfSections(in tableView: UITableView) -> Int {
//    return datesFromDictionary.count
//}
//func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    return datesFromDictionary[section].cells.count
//}
//
//func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = tableView.dequeueReusableCell(withIdentifier: cellWithTwoNext) as? CellWithTwoNext
//
//    let datesModel = datesFromDictionary[indexPath.section].cells[indexPath.row]
//
//    cell?.configure(datesModel)
//    return cell ?? UITableViewCell()
//}
//}
//
//
//extension ViewContrTwo: UITableViewDelegate {}
//
