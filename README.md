Viper architecture is used for this pet project. 

VIPER
V - View, I - Interactor, P - Presenter, E - Entity, R - Router

View - Responsibility of view is to send user actions to presenter and show whatever the presenter asks it to.
Interactor - It has the business logic for the app specified by a use case.
Presenter - Contains the view logic for preparing content for display and for reacting to user interactions.
Entity - Basic model for objects used by interaction.
Router - Contains logic for routing of screens.
Why VIPER?
Our traditional MVC and MVM architecture that we are all accquainted with have one primary problem i.e Bulky Controllers. Since all our business logic has been dumped in controller, at the end we see a huge and fat controller which becomes difficult to manage if our project is to be scalable. So thse are the primary reasons why we need VIPER:

To make the structure more modular.
To build the application on Single responsibility principle.
To reduce the load and dependency on controllers.
To build the app on basis of use cases or behaviour based.
App Description

| App navigation        |
|-----------------------|
| ![](pizzaapp.gif)     |



