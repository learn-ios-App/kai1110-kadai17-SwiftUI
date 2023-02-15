
import SwiftUI

struct ListItemView: View {
    @State var fruit: FruitModel
    @State var isEdit = false
    var body: some View {
        HStack {
            HStack {
                Button(action: {
                    fruit.check.toggle()
                }) {
                    Image(
                        systemName: fruit.check
                        ? "checkmark.circle"
                        : "circle"
                    )
                    .foregroundColor(.black)
                }
                Text(fruit.name)
            }
            Spacer()
            Button(action: {
                isEdit = true
            }) {
                Image(systemName: "i.circle")
            }
            .buttonStyle(BorderlessButtonStyle())
        }
        .sheet(isPresented: $isEdit) {
            EditView(
                text: fruit.name,
                edit: { text in
                    fruit.name = text
                    isEdit = false
                },
                cancel: {
                    isEdit = false
                }
            )
        }
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(fruit: FruitModel(name: "リンゴ", check: true))
    }
}
