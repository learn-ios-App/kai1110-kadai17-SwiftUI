
import SwiftUI

struct ContentView: View {
    @StateObject private var fruitViewModel = FruitViewModel()
    var body: some View {
        NavigationStack {
            List {
                ForEach(fruitViewModel.fruits) { fruit in
                    ListItemView(fruit: fruit)
                }
                .onDelete(perform: fruitViewModel.delteteFruit)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        fruitViewModel.didTapPlusButton()
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $fruitViewModel.isAddView) {
            AddFruitView(
                save: { text in
                    fruitViewModel.didTapAddViewSaveButton(text: text)
                },
                cancel: {
                    fruitViewModel.didTapAddViewCancelButton()
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
