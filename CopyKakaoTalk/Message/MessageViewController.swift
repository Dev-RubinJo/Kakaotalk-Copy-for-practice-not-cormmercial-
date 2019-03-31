//
//  SecondViewController.swift
//  CopyKakaoTalk
//
//  Created by YooBin Jo on 09/03/2019.
//  Copyright © 2019 YooBin Jo. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

    @IBOutlet weak var messageTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageTable.delegate = self
        messageTable.dataSource = self
        
        let messageNibName = UINib(nibName: "KakaotalkChattingRoomCell", bundle: nil)
        messageTable.register(messageNibName, forCellReuseIdentifier: "chattingRoomCell")
    }


}

extension MessageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
