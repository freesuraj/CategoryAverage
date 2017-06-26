### Product Category Average:

Calculates the average cubic weight of products

#### Installation

Best way to run is to use `XCode` in Mac OSx.
- Xcode version 8 or above
- Swift version 3.0 or above

#### Project Structure

The main source files are in the group `Source` which contains:

* Controller: View Controllers
* Network: Source files related to network logic
* Model: Source files related to product and page model

The initial configuration of the project can be changed from `Config.swift` file. 
Configurable parameters:
- Base URL (`baseUrl`)
- firstPage end point(`firstPage`)
- category type (`categoryType`)

#### Test
All the major source files are tested. To run the test in XCode, use the command `Command+U`

#### Screenshots
![screenshot](https://github.com/freesuraj/CategoryAverage/blob/master/screens/test.png?raw=true)
![screenshot](https://github.com/freesuraj/CategoryAverage/blob/master/screens/processing.png?raw=true)
![screenshot](https://github.com/freesuraj/CategoryAverage/blob/master/screens/processed.png?raw=true)
