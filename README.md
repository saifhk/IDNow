# IDNow
in this project I will work on a technical test for IDNow company I try to make a 2 different approach for the second subject 
the subject/APP : A little treasure hunt game where the rewards are random and came after a random time. Multiple hunts can be done
at the same time. You can also vary the response time from the server.


## Table of Contents
- [Installation](#installation)
- [Usage](#usage)
- [Technical Choices](#technical Choices)
- [License](#license)
- [Contact](#contact)
- [Dedicace](#dedicace)
## Installation
- you need to install node js
- you need to have xcode version later the 12.3
- clone the project using : git clone git@github.com:saifhk/IDNow.git
- cd IDNow to go inside the project

you will find 3 different folders: 
1. IDNowTechTest : IOS APP using Swift 5.
2. IDNowTechTestSwiftUI : IOS APP using swiftUI.
3. treasure serveur : the backend serveur.

For the first and the second folder it's the same application with two  different approach I want to use in th first folder the swift 5 combine and mvvm architecture(the unit test it's only include un this project).
For the second folder it's the treasure app with swiftUI approach

- Then go inside the treasureServeur and sun this commande from the terminal : nodemon Serveur.js
- you can choose what project you want to run just open the first or the second folder and open the file with extension "xcodeproj"


## Usage
After runing the project from the serveur side and open the app you will find a button call start(check the image bellow please) when you hit that button you will start fetching the results.
the response will take between 3 to 10 second randomly no fixed time.

![Simulator Screen Shot - iPhone 12 Pro - 2023-11-06 at 09 32 09](https://github.com/saifhk/IDNow/assets/35005962/aef2e6cd-12d6-4e00-8fc2-1a9afd9c5f49)



## Technical Choices


### Programming Language

In this exemple I have create two different project one in swift 5 and the other one in swiftUI
because with both langage we can create a great apps and I want to demonstrate the difference of the use.
one of my favorite think is when you can able to use both together because they have been made to work together
SwiftUI : simplifies UI development.
Swift  :code can be highly optimized for performance-critical tasks. 
Node JS : is a great solution to create the serveur side and easy to use.

remarque : the use of swift swiftUI it depends on what we want to create and the complexity of the task.
### Architecture

MVVM : is easier to test and also it perfect match with Combine and reactive programming.

### Frameworks and Libraries

Framework : Node JS and express for the backend server
why I have use Node JS because I was not able to use vapor(ma laptop is a bit old macBook 2013) and also I have a good knowledge in java script and node js I was major in my university in java script courses and framework(one of my favorite )

### Asynchronous Handling

Combine : 
- It asynchrnous programming and for this project we can only use the promise way(waiting fot data before proceed)
- So easy for data Binding
- We can notice the UI Update easier
- Memory managemeht
- good to test asynchronous code with expectations
asyn/await:
- So simple to use
- Improve prodectivity

### Testing Strategy

in this exemple I have write unit test for the project and I have focus on testing the serveur data Response.
### Design Patterns

what kind of DP I have use and why?
Singleton : acces for the object is so easy and can provides a global point of access 
Factory : Factories can make your code more organized and readable.
Dependency Injection : it reduce the code complexity also it make it easier to write Testing code.

### Development Environment

IDE (APP): Xcode
IDE (node js): Visual studio

### Version Control

I have choose Git for this project and use the branch system : I was naming the branches depends on the feature that I want to made and adding the underscore exemple to add the unit test : add_unit_test

### Security and Privacy

the use of Keychain for storing the sensitive data is highly recommended

### Performance Optimization

I didn't use the storyboard here because it take more size and more resources.

### Code Style and Guidelines
I have use the genarious type for this example in case we want to use the service again no need to change the metod or the function just create your model and hit the service


## Additional Information

Some resources to explain what do we have to use MVVM architecture : 
https://www.ramotion.com/blog/what-is-mvvm/#:~:text=MVVM%20helps%20you%20separate%20concerns,it's%20modular%20and%20loosely%2Dcoupled.

## License
This project is licensed under the IDNow Company project.
## Contact
for more details you can reach out via the email : saifjuini1444@gmail.com
or you can reach out to me on linkedIn : https://www.linkedin.com/in/saifeddine-jouini-8b132113b/

## Dedicace
In the end I just want to thank the IDNow members and team also I really enjoy the challange it takes me 9 hours to finish it and looking forward to hear from you

