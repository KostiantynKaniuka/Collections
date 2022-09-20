//
//  SetsViewController.swift
//  Collections
//
//  Created by Константин Канюка on 17.08.2022.
//

import UIKit

class SetViewController: UIViewController {
    //MARK: - Outlets
    
    @IBOutlet var firstTextField: UITextField!
    @IBOutlet var secondTextField: UITextField!
    @IBOutlet var matchingLettersLabel: UILabel!
    @IBOutlet var notMatchingLettersLabel: UILabel!
    @IBOutlet var uniqueCharactersButton: UIButton!
    @IBOutlet var uniqueCharactersLabel: UILabel!
    private var model = SetModel()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uniqueCharactersButton.titleLabel?.textAlignment = .center
        matchingLettersLabel.isHidden = true
        notMatchingLettersLabel.isHidden = true
        uniqueCharactersLabel.isHidden = true
        firstTextField.delegate = self
        secondTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
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
            model.firsTextFieldText = Set(firstTextField.text ?? "")
        } else if textField == secondTextField {
            model.secondTextFieldText = Set(secondTextField.text ?? "")
        }
        return true
    }
}
