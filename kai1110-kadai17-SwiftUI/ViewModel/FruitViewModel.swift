
import Foundation

class FruitViewModel: ObservableObject {
    @Published var fruits: [FruitModel] = [
        FruitModel(name: "リンゴ", check: true),
        FruitModel(name: "バナナ", check: false),
        FruitModel(name: "ミカン", check: true),
        FruitModel(name: "パイナップル", check: false)
    ]
    //具体的な処理はVMでするためにここで宣言する
    @Published var isAddView = false
    @Published var isEditView = false

    //配列の要素削除
    func delteteFruit(offsets: IndexSet) {
        fruits.remove(atOffsets: offsets)
    }
    
    //配列の要素追加
    func addFruit(text: String) {
        fruits.append(FruitModel(name: text, check: true))
    }
    
    //配列の要素を編集
    func updateFruit(newFruit: FruitModel) {
        guard let index = fruits.firstIndex(where: { $0.id == newFruit.id }) else {
            return
        }
        fruits[index] = newFruit
    }
    
    func didTapPlusButton() {
        isAddView = true
    }
    
    func didTapAddViewCancelButton() {
        isAddView = true
    }
    
    func didTapAddViewSaveButton(text: String) {
        addFruit(text: text)
        isAddView = false
    }
}
