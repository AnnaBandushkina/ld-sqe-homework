Meta:
@API
@Petstore

As a QA engineer
I want to verify that the Petstore API works correctly
So that users can create accounts, log in, manage pets

Scenario: Verify that allows creating a User
Given request body: {"id":101,"username":"user1001","firstName":"John","lastName":"Doe","email":"john.doe1001@example.com","password":"pass123","phone":"1234567890","userStatus":1}
When I set request headers:
|name         |value                          |
|Content-Type |application/json; charset=UTF-8|
When I execute HTTP POST request for resource with URL `https://petstore.swagger.io/v2/user`
Then response code is equal to `200`

Scenario: Verify that allows login as a User
When I set request headers:
|name         |value                          |
|Content-Type |application/json; charset=UTF-8|
When I execute HTTP GET request for resource with URL `https://petstore.swagger.io/v2/user/login?username=user1&password=pass123`
Then response code is equal to `200`

Scenario: Verify that allows adding a new Pet
Given request body: {"name":"${petName}","photoUrls":[],"category":{"id":1,"name":"dogs"},"tags":[{"id":1,"name":"cookies"}],"status":"available"}
When I set request headers:
|name                 |value                          |
|Content-Type         |application/json; charset=UTF-8|
When I execute HTTP POST request for resource with URL `https://petstore.swagger.io/v2/pet`
Then response code is equal to `200`
When I save JSON element value from `${response}` by JSON path `$.id` to story variable `petId`

Scenario: Verify that allows updating Pet’s name and status
Given request body: {"id":${petId},"name":"LadyUpdated","photoUrls":[],"category":{"id":1,"name":"dogs"},"tags":[{"id":1,"name":"cookies"}],"status":"available"}
When I set request headers:
|name         |value                          |
|Content-Type |application/json; charset=UTF-8|
When I execute HTTP PUT request for resource with URL `https://petstore.swagger.io/v2/pet`
Then response code is equal to `200`

Scenario: Verify that allows deleting Pet
When I execute HTTP DELETE request for resource with URL `https://petstore.swagger.io/v2/pet/${petId}`
Then response code is equal to `200`
