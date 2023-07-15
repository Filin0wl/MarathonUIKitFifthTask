//
//  ViewController.swift
//  MarathonUIKitFifthTask
//
//  Created by Anastasiia Perminova on 14.07.2023.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    lazy var presentButton: UIButton = {
        let button = UIButton()
        let butConfig = UIButton.Configuration.plain()
        button.configuration = butConfig
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Present", for: .normal)
        button.addTarget(self, action: #selector(click), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(presentButton)
        NSLayoutConstraint.activate([
            presentButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc func click(_ sender: Any){
        let vc = ResizingViewController()
        vc.modalPresentationStyle = .popover
        vc.preferredContentSize = CGSize(width: 300, height: 280)
        let ppc = vc.popoverPresentationController
        ppc?.permittedArrowDirections = .up
        ppc?.delegate = self
        ppc?.sourceView = sender as? UIView

        present(vc, animated: true, completion: nil)
    }

    public func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
            return .none
        }
}

