//
//  ViewController.swift
//  UIKit-HW2-2
//
//  Created by Дима on 11/17/24.
//

import UIKit

class ViewController: UIViewController {
    let name = "Имя"
    let surname = "Фамилия"
    
    let margin: CGFloat = 30
    let height: CGFloat = 19
    let backgroundColor: UIColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
    enum textStyle: String {
        case bold, italic, regular
    }
    
    let canvasImageView = UIImageView()
    let profileImageView = UIImageView()
    let profileInfoBlock = UIView()
    var nameSurnameLabel = UILabel()
    var editButton = UIButton()
    var addDescriptionLabel = UILabel()
    let descriptionFill = UITextView()
    var changePasswordLabel = UILabel()
    var oldPasswordField = UITextField()
    var newPasswordField = UITextField()
    var saveButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        canvasImageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 180)
        canvasImageView.image = UIImage(named: "canvas")
        canvasImageView.contentMode = .scaleAspectFill
        canvasImageView.clipsToBounds = true // реальная обрезка фотки, а не визуальная, иначе дальнейшая верстка плывет
        view.addSubview(canvasImageView)
        
        profileImageView.frame = CGRect(x: margin, y: canvasImageView.frame.maxY + margin, width: 100, height: 100)
        profileImageView.image = UIImage(named: "profile")
        profileImageView.layer.cornerRadius = 50
        profileImageView.clipsToBounds = true
        profileImageView.contentMode = .scaleAspectFill
        view.addSubview(profileImageView)
        
        nameSurnameLabel = setupLabel(text: "\(name) \(surname)", textStyle: .bold, x: profileImageView.frame.maxX + margin / 2, y: profileImageView.frame.minY + 2 * margin / 3)
        view.addSubview(nameSurnameLabel)
        
        editButton = setupButton(text: "Редактировать", x: profileImageView.frame.maxX + margin / 2, y: profileImageView.frame.midY, width: 147, height: 34)
        view.addSubview(editButton)
        
        addDescriptionLabel = setupLabel(text: "Добавить описание", textStyle: .regular, x: 5 * margin / 3, y: profileImageView.frame.maxY + margin)
        view.addSubview(addDescriptionLabel)
        
        descriptionFill.backgroundColor = backgroundColor
        descriptionFill.layer.cornerRadius = 20
        descriptionFill.font = .systemFont(ofSize: 16)
        descriptionFill.frame = CGRect(x: margin, y: addDescriptionLabel.frame.maxY + 2 * margin / 3, width: view.frame.width - margin * 2, height: 150)
        view.addSubview(descriptionFill)
        
        changePasswordLabel = setupLabel(text: "Изменить пароль", textStyle: .regular, x: 5 * margin / 3, y: descriptionFill.frame.maxY + 2 * margin / 3)
        view.addSubview(changePasswordLabel)
        
        oldPasswordField = setupTextField(placeholder: "Старый пароль", x: margin, y: changePasswordLabel.frame.maxY + 2 * margin / 3)
        view.addSubview(oldPasswordField)
        
        newPasswordField = setupTextField(placeholder: "Новый пароль", x: margin, y: oldPasswordField.frame.maxY + 2 * margin / 3)
        view.addSubview(newPasswordField)

        saveButton = setupButton(text: "Сохранить", x: margin, y: view.frame.height - 107, width: view.frame.width - 2 * margin, height: 59)
        view.addSubview(saveButton)
    }
    
    func setupLabel(text: String, textStyle: textStyle, x: CGFloat, y: CGFloat) -> UILabel {
        let label = UILabel()
        label.frame = CGRect(x: x, y: y, width: 160, height: height)
        label.text = text
        switch textStyle {
        case .bold: label.font = .boldSystemFont(ofSize: 16)
        case .italic: label.font = .italicSystemFont(ofSize: 16)
        case .regular: label.font = .systemFont(ofSize: 16)
        }
        return label
    }
    func setupTextField(placeholder: String, x: CGFloat, y: CGFloat) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.frame = CGRect(x: x, y: y, width: view.frame.width - 2 * margin, height: 52)
        textField.backgroundColor = backgroundColor
        textField.layer.cornerRadius = 10
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 2 * margin / 3, height: 0))
        return textField
    }
    func setupButton(text: String, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> UIButton {
        let button = UIButton()
        button.frame = CGRect(x: x, y: y, width: width, height: height)
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0, green: 87/255, blue: 1, alpha: 1)
        button.layer.cornerRadius = 10
        return button
    }
}

