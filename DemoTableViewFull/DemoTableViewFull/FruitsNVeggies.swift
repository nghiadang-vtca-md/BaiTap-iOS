//
//  FruitsNVeggies.swift
//  DemoTableViewFull
//
//  Created by nghiadang1205 on 3/16/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class FruitsNVeggies {
    var name: String
    var foodItems: [Food]
    var isExpanded: Bool
    
    init(name: String, foodItems: [Food]) {
        self.name = name
        self.foodItems = foodItems
        self.isExpanded = true
    }
    
    static func FoodItems() -> [FruitsNVeggies] {
        return [FruitsNVeggies.fruitSet(), FruitsNVeggies.veggiesSet()]
    }
    
    static func fruitSet() -> FruitsNVeggies {
        var fruitItems = [Food]()
        fruitItems.append(Food(title: "Apple", subtitle: "Apples are high in fiber, vitamin C and various antioxidants.", image: #imageLiteral(resourceName: "apple_small.jpg"), fullImage: #imageLiteral(resourceName: "apple.jpg")))
        fruitItems.append(Food(title: "Apricot", subtitle: "Apricots are packed with Vitamin A, which is also known as retinol.", image: #imageLiteral(resourceName: "appricot_small.jpg"), fullImage: #imageLiteral(resourceName: "appricot.jpg")))
        fruitItems.append(Food(title: "Blueberry", subtitle: "The fiber, potassium, folate, vitamin C, vitamin B6, and phytonutrient content in blueberries supports heart health.", image: #imageLiteral(resourceName: "blueberries_small.jpg"), fullImage: #imageLiteral(resourceName: "blueberries.jpg")))
        fruitItems.append(Food(title: "Fig", subtitle: "Figs are high in fiber and a good source of magnesium, manganese, calcium, copper, potassium, vitamin K and B6.", image: #imageLiteral(resourceName: "fig_small.jpg"), fullImage: #imageLiteral(resourceName: "fig.jpg")))
        fruitItems.append(Food(title: "Orange", subtitle: "Consuming vitamin C supplements does not provide the same protective benefits as drinking a glass of orange juice.", image: #imageLiteral(resourceName: "oranges_small.jpg"), fullImage: #imageLiteral(resourceName: "oranges.jpg")))
        fruitItems.append(Food(title: "Peache", subtitle: "Peaches offer a rich treasure of minerals such as calcium, potassium, magnesium, iron, manganese, phosphorous, zinc, and copper. ", image: #imageLiteral(resourceName: "peach_small.jpg"), fullImage: #imageLiteral(resourceName: "peach.jpg")))
        fruitItems.append(Food(title: "Plum", subtitle: "Plums help increase the absorption of iron into the body.", image: #imageLiteral(resourceName: "plum_small.jpg"), fullImage: #imageLiteral(resourceName: "plum.jpg")))
        fruitItems.append(Food(title: "Strawberry", subtitle: " Strawberry nutrients include vitamin C, folate, potassium, manganese, dietary fiber, and magnesium.", image: #imageLiteral(resourceName: "strawberry_small.jpg"), fullImage: #imageLiteral(resourceName: "strawberry.jpg")))
        return FruitsNVeggies(name: "Fruits", foodItems: fruitItems)
    }
    
    static func veggiesSet() -> FruitsNVeggies {
        var veggieItems = [Food]()
        veggieItems.append(Food(title: "Eggplant", subtitle: "Eggplants are excellent amounts of fiber, folate, potassium and manganese, as well as vitamins C, K, and B6", image: #imageLiteral(resourceName: "eggplant_small.jpg"), fullImage: #imageLiteral(resourceName: "eggplant.jpg")))
        veggieItems.append(Food(title: "Peas", subtitle: "Peas good source of vitamin K, manganese, dietary fiber, vitamin B1, copper, vitamin C, phosphorus and folate.", image: #imageLiteral(resourceName: "peas_small.jpg"), fullImage: #imageLiteral(resourceName: "peas.jpg")))
        veggieItems.append(Food(title: "Pumpkin", subtitle: "The fiber, potassium, and vitamin C content in pumpkin all support heart health.", image: #imageLiteral(resourceName: "pumpkin_small.jpg"), fullImage: #imageLiteral(resourceName: "pumpkin.jpg")))
        veggieItems.append(Food(title: "Spinach", subtitle: "Low in fat and even lower in cholesterol, spinach is high in niacin and zinc, as well as protein, fiber, vitamins A, C, E and K, thiamin, vitamin B6, folate, calcium, iron, magnesium, phosphorus, potassium, copper, and manganese.", image: #imageLiteral(resourceName: "spinach_small.jpg"), fullImage: #imageLiteral(resourceName: "spinach.jpg")))
        veggieItems.append(Food(title: "Tomatoes", subtitle: "Tomatoes are the major dietary source of the antioxidant lycopene, which has been linked to many health benefits, including reduced risk of heart disease and cancer.", image: #imageLiteral(resourceName: "tomatoes_small.jpg"), fullImage: #imageLiteral(resourceName: "tomatoes.jpg")))
        veggieItems.append(Food(title: "Kale", subtitle: "Kale is low in calorie, high in fiber and has zero fat. One cup of kale has only 36 calories, 5 grams of fiber and 0 grams of fat.", image: #imageLiteral(resourceName: "kale_small.jpg"), fullImage: #imageLiteral(resourceName: "kale.jpg")))
        veggieItems.append(Food(title: "Cabbage", subtitle: "Cabbage is an excellent source of vitamin K, vitamin C and vitamin B6.", image: #imageLiteral(resourceName: "cabbage_small.jpg"), fullImage: #imageLiteral(resourceName: "cabbage.jpg")))
        veggieItems.append(Food(title: "Carrots", subtitle: "Vitamin A and antioxidants protects the skin from sun damage.", image: #imageLiteral(resourceName: "carrots_small.jpg"), fullImage: #imageLiteral(resourceName: "carrots.jpg")))
        return FruitsNVeggies(name: "Veggies", foodItems: veggieItems)
        
        
    }
}
