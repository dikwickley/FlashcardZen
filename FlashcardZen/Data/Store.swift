//
//  Flashcards.swift
//  FlashcardZen
//
//  Created by Aniket Rawat on 29/03/23.
//

import Foundation

// making temp data for testing


class Store: ObservableObject {
    
    
    static var shared = Store()
    
    private init() { }
    
    @Published var flashcards = [
        Flashcard(
            id: UUID().uuidString,
            title: "Cascading Style Sheets",
            content: "CSS is a stylesheet language used to define how a web page written HTML or XHTML should be presented and displayed in a web browser."
        ),
        Flashcard(
            id: UUID().uuidString,
            title: "Dynamic HyperText Markup Language",
            content: "DHTML is the term used when HTML, JavaScript and CSS are used to create animated or interactive web sites."
        ),
        Flashcard(
            id: UUID().uuidString,
            title: "HyperText Markup Language",
            content: "HTML is a tag-based markup language used to create web pages. Every site on the internet uses HTML in some form."
        ),
        Flashcard(
            id: UUID().uuidString,
            title: "Active Server Pages",
            content: "ASP is a server-side scripting language used to add business logic and database interactivity to dynamic websites."
        ),
        Flashcard(
            id: UUID().uuidString,
            title: "CGI",
            content: "CGI is a protocol that allows server applications to interact with client web browsers."
        ),
        Flashcard(
            id: UUID().uuidString,
            title: "PHP Hypertext Preprocessor/Personal Home Page",
            content: "PHP is a server-side scripting language used to add business logic and database interactivity to dynamic websites."
        ),
        Flashcard(
            id: UUID().uuidString,
            title: "Amazon Web Services",
            content: "AWS are a collection of remote application services offered by Amazon.com."
        ),
        Flashcard(
            id: UUID().uuidString,
            title: "Create, Read, Update and Delete",
            content: "CRUD are the four basic functions of any persistent storage system, most commonly a database system."
        ),
        Flashcard(
            id: UUID().uuidString,
            title: "SQL Structured Query Language",
            content: "SQL is a special programming language used to retrieve data from and modify relational database systems."
        ),
        Flashcard(
            id: UUID().uuidString,
            title: "CRON Command Run ON",
            content: "CRON is a scheduling program on most Unix system. It is used to schedule time-sensitive activities for software programs to perform."
        ),
        Flashcard(
            id: UUID().uuidString,
            title: "HyperText Transfer Protocol",
            content: "HTTP is a communications protocol used for transferring data available on the Web."
        ),
        Flashcard(
            id: UUID().uuidString,
            title: "AJAX",
            content: "AJAX is a web programming technique that uses JavaScript to transparently interact with a web server without a web page reload."
        ),
        Flashcard(
            id: UUID().uuidString,
            title: "Document Object Model",
            content: "DOM is a standard object model for representing HTML and XML formats as objects."
        ),
        Flashcard(
            id: UUID().uuidString,
            title: "Graphics Interchange Format",
            content: "GIF is a popular graphics format most commonly used for graphics in web sites."
        ),
        Flashcard(
            id: UUID().uuidString,
            title: "WYSIWYG",
            content: "What You See Is What You Get WYSIWYG is used to describe web development applications in which the authoring environment closely resembles the final output of the program."
        )
    ]
}

