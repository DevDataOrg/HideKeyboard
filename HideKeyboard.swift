import UIKit
import Foundation

//Variant 1
//Подписываетесь под протокол UIGestureRecognizerDelegate и в теле класса инициализируете функцию gestureRecognizer.

func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
    return true
}

//Потом в методе viewDidLoad создаете жест на свайп вниз, подписываетесь под делегат и добавляете этот жест к самой вьюхи.

let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.hideKeyboardOnSwipeDown))
swipeDown.delegate = self
swipeDown.direction =  UISwipeGestureRecognizerDirection.down
self.tableView.addGestureRecognizer(swipeDown)


//Ну а дальше остается создать функцию, которую в методе viewDidLoad Вы прописали в селекторе и прописать конец редактирования.

func hideKeyboardOnSwipeDown() {
    view.endEditing(true)
}
//Соответственно так можно прописать любой жест.


//Variant 2
// Начать редактирование текстового поля
func textFieldDidBeginEditing(_ textField: UITextField) {
    moveTextField(textField, moveDistance: -150, up: true)
}

// Завершите редактирование текстового поля
func textFieldDidEndEditing(_ textField: UITextField) {
    moveTextField(textField, moveDistance: -150, up: false)
}

// Скрыть клавиатуру при нажатии клавиши return
func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
}

// Переместите текстовое поле в красивой анимации!
func moveTextField(_ textField: UITextField, moveDistance: Int, up: Bool) {
    let moveDuration = 0.3
    let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
    
    UIView.beginAnimations("animateTextField", context: nil)
    UIView.setAnimationBeginsFromCurrentState(true)
    UIView.setAnimationDuration(moveDuration)
    self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
    UIView.commitAnimations()
}
