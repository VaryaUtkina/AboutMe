//
//  User.swift
//  AboutMe
//
//  Created by Варвара Уткина on 10.10.2024.
//

import Foundation

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            login: "User",
            password: "Password",
            person: Person.getPerson()
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let post: String
    let bio: String
    let photo: String
    
    var fullname: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
        Person(
            name: "Варя",
            surname: "Уткина",
            post: "iOS developer",
            bio: "Я закончила курс по iOS-разработке в онлайн-школе Swiftbook. Сейчас я нахожусь в поиске работы по новой специальности и буду рада Вашим предложениям. \n Я занимаюсь фитнесом, а в зимнее время года люблю ездить с друзьями на горнолыжный курорт Шерегеш. У меня есть кот Персик и щенок Буба. А еще я мечтаю сходить в поход в горы вместе с собакой и мужем. Спасибо за внимание, обнимаю!",
            photo: "myPhoto"
        )
    }
}
