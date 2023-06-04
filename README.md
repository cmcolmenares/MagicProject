# Carlos Colmenares Test
## Description
MasterProject is a private repository for a small test developed with VIPER design pattern (first approach) with the following structure:

- Base folder contains all the base protocols, classes and extensions for VIPER design pattern works
- Modules folder contains all the modularized sections for the app (In this case only Home)
- App&Config folder contains configuration files for AppDelegate and SceneDelegate
- Data folder contains:
    * Mocks folder, used on unit tests to emulate services
    * JSON folder, used on mocks to emulate responses
    * Extensions folder
    * Models folder, which includes response models for API request and interactor models to structure the data (separated by modules)
- Network folder contains a NetworkManager which has the responsability to handle the async HTTPrequest and NetworkImages to download images asynchronously
- MasterProjectTests, contains a simple example of fetch Data test cases and load model for presenter
- MasterProjectUITests, in the future will contain the UI Tests for the app
- Utils folder, contains global elements for the app and UI helper elements like spinners
- Implemented languages: Spanish and English

# Libraries
* [Alamofire](https://github.com/Alamofire/Alamofire)

# Improves

- Following the SOLID principles, a protocol-based structure could be implemented for the entire design pattern.
- Outlets should be privates 
- Parameters passed to cells can be encapsulated in objects
- Error Handler Module
- Create a Builder to create URLs dinamically based on current environment
- Mocks can be improved by implementing more scenarios 

# Next steps to run the project

- Clone this repo to your local machine to get started
- Navigate through the terminal to the project's folder and run the following line: 

pod install

- Open the MasterProject.xcworkspace file with XCode and press the run button y the top left.
- To run the Unit Tests change the scheme to MasterProjectTests, open the file WeatherServiceTests and press play on the button next to the class definition
