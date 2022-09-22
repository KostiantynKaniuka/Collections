//
//  SetsViewController.swift
//  Collections
//
//  Created by Константин Канюка on 17.08.2022.
//

import UIKit

final class SetViewController: UIViewController {
    private var model = SetModel()
    
    //MARK: - Outlets
    
    @IBOutlet private var firstTextField: UITextField!{
        didSet {
            firstTextField.delegate = self
        }
    }
    @IBOutlet private var secondTextField: UITextField! {
        didSet {
            secondTextField.delegate = self
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
        model.matchingLetters()
        matchingLettersLabel.text = model.matchingLettersResult
        matchingLettersLabel.isHidden = false
    }
    
    @IBAction func allCharactersThatDoNotMatchButtonTapped(_ sender: Any) {
        model.notMatchingLetters()
        notMatchingLettersLabel.text = model.notMatchingLettersResult
        notMatchingLettersLabel.isHidden = false
    }
    
    @IBAction func uniqueButtonTapped(_ sender: Any) {
        model.uniqueLetters()
        uniqueCharactersLabel.text = model.uniqueLettersResult
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
        if textField == firstTextField {
            model.firstTextFieldText = Set(firstTextField.text ?? "")
        } else if textField == secondTextField {
            model.secondTextFieldText = Set(secondTextField.text ?? "")
        }
        return true
    }
}
