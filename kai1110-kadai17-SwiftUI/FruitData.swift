
import Foundation

struct FruitModel: Identifiable {
    let id = UUID()
    var name: String
    var check: Bool
}

class FruitData: ObservableObject {
    @Published var fruits: [FruitModel] = [
        FruitModel(name: "リンゴ", check: true),
        FruitModel(name: "バナナ", check: false),
        FruitModel(name: "ミカン", check: true),
        FruitModel(name: "パイナップル", check: false)
    ]

    func delteteFruit(offsets: IndexSet) {
        self.fruits.remove(atOffsets: offsets)
    }
}
