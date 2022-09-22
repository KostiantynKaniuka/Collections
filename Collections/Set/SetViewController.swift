//
//  SetsViewController.swift
//  Collections
//
//  Created by Kostiantyn Kaniuka on 17.08.2022.
//

import UIKit

final class SetViewController: UIViewController {
    private var model = SetModel()
    
    //MARK: - Outlets
    
    @IBOutlet private var topTextField: UITextField!{
        didSet {
            topTextField.delegate = self
        }
    }
    @IBOutlet private var bottomTextField: UITextField! {
        didSet {
            bottomTextField.delegate = self
        }
    }
    @IBOutlet private var matchingLettersLabel: UILabel!
    @IBOutlet private var notMatchingLettersLabel: UILabel!
    @IBOutlet private var uniqueCharactersButton: UIButton!
    @IBOutlet private var uniqueCharactersLabel: UILabel!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.title = "Sets"
    }
    
    //MARK: - Actions
    
    @IBAction func allMatchingLettersButtonTapped(_ sender: Any) {
        matchingLettersLabel.text = model.matchingLetters()
        matchingLettersLabel.isHidden = false
    }
    
    @IBAction func allCharactersThatDoNotMatchButtonTapped(_ sender: Any) {
   
        notMatchingLettersLabel.text = model.notMatchingLetters()
        notMatchingLettersLabel.isHidden = false
    }
    
    @IBAction func uniqueButtonTapped(_ sender: Any) {
        uniqueCharactersLabel.text = model.uniqueLetters()
        uniqueCharactersLabel.isHidden = false
    }
    
    private func setUp() {
        uniqueCharactersButton.titleLabel?.textAlignment = .center
        matchingLettersLabel.isHidden = true
        notMatchingLettersLabel.isHidden = true
        uniqueCharactersLabel.isHidden = true
    }
}

//MARK: - TextField Delegate

extension SetViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textField.isSelected = false
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == topTextField {
            model.firstTextFieldText = model.transformFirstText(topTextField: topTextField.text ?? "")
        } else if textField == bottomTextField {
            model.secondTextFieldText = model.transformSecondText(bottomTextField: bottomTextField.text ?? "")
        }
        return true
    }
}
