//
//  ResizingViewController.swift
//  MarathonUIKitFifthTask
//
//  Created by Anastasiia Perminova on 14.07.2023.
//

import UIKit

class ResizingViewController: UIViewController {

    private lazy var sizeButton: UISegmentedControl = {
        let control = UISegmentedControl(items: ["280pt","150pt"])
        control.translatesAutoresizingMaskIntoConstraints = false
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(changedSegment), for: .valueChanged)
        return control
    }()

    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .close)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeViewController), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(sizeButton)
        view.addSubview(closeButton)
        NSLayoutConstraint.activate([
            sizeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            sizeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }

    @objc func changedSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
            case 0:
                self.preferredContentSize = CGSize(width: 300, height: 280)
            case 1:
                self.preferredContentSize = CGSize(width: 300, height: 150)
            default:
                break
            }
    }

    @objc func closeViewController(){
        self.dismiss(animated: true)
    }
}
