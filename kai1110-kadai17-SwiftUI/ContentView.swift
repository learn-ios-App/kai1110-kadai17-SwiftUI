
import SwiftUI

struct ContentView: View {
    @StateObject private var fruitData = FruitData()
    @State private var isAddView = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(fruitData.fruits) { fruit in
                    ListItemView(fruit: fruit)
                }
                .onDelete(perform: fruitData.delteteFruit)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isAddView = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $isAddView) {
            AddFruitView(
                save: { text in
                    fruitData.addFruit(text: text)
                    isAddView = false
                },
                cancel: {
                    isAddView = false
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
