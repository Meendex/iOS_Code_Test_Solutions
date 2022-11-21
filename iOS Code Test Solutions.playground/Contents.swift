//Task 1

import Foundation
struct CartProductResult {
    var id: Int
    var title: String
    var quantity: Int
}
let cartProducts = [
CartProductResult(id: 1, title: "nike shoe 1", quantity: 5), CartProductResult(id: 2, title: "nike shoe 2", quantity: 2), CartProductResult(id: 3, title: "soap", quantity: 6)
]


/// Print `cartProducts` in this format as specified: /// * id1-title1
/// * id2-title2
/// * id3-title3

//Solution

for cartProduct in cartProducts {
    print("* \(cartProduct.id)" + "-\(cartProduct.title)")
}

// Task 2

struct SearchProductResult {
    var id: Int
    var title: String
    var position: Int
}
let productList: [SearchProductResult] = [ SearchProductResult(id: 1, title: "nike shoe 3", position: 1), SearchProductResult(id: 5, title: "pen", position: 2)
]

//Solution

for productList in productList {
    print("* \(productList.id) " + "\(productList.title)")
}

for cartProduct in cartProducts {
    print("* \(cartProduct.id) " + "\(cartProduct.title)")
}

//Task 3

func printWithDelay(product1: CartProductResult, product2: CartProductResult, completion: (@escaping ()-> Void)) {
    
}

//Solution

func printWithDelay(products: [CartProductResult], completion: (@escaping ()-> Void)) {
    for product in products {
        sleep(1)
        print("Wait 1 second")
        print("ID of the product :\(product.id)")
    }
    completion()
}

printWithDelay(products: cartProducts) {
    sleep(1)
    print("Call completion")
}

//Task 4

struct Products: Decodable {
    let id: String
    let options: [Products]
}

func getProducts(fileName: String) -> Products? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(Products.self, from: data)

            printProducts(products: [jsonData])

            return jsonData
        } catch {
            print("parse failed \(error)")
        }
    }
    return nil
}
func printProducts(products: [Products]) {
    for product in products {
        print("ID: \(product.id)")
        if (!product.options.isEmpty) {
            printProducts(products: product.options)
        }
    }
}

//Task 5

// https://github.com/Meendex/CalculatorApp

