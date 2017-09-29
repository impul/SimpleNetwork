# SimpleNetwork
Evolution of my network manager

# How to use

* Add Network.swift and Endpointprotocol.swift to your project
* Create enpoints (enumes with your requests like login) to your RESTAPI
* Maintain your endopoints to EndpointProtocol
    ```YourEndpoint:EnpointProtocol```
* Create services to each endpoints where you can call the network methods

``` Network().request(YourEndpoint.enpointMethod(enpointMethodOptions:Options)```
* Handle responce in closure
* Enjoy
