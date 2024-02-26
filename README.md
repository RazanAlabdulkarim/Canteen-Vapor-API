# Canteen Supplier-Tracking 

This project showcases the development of a RESTful API integrated with a PostgreSQL database using the Vapor framework, catering specifically to canteen suppliers seeking efficient management of school canteen operations. The backend services are meticulously designed to handle various aspects of canteen management, including menu items, and staff details, ensuring optimal inventory management, menu planning, order processing, and supplier coordination.


## Key Features

- RESTful API integration for seamless data manipulation
- PostgreSQL database for reliable data storage and retrieval
- Comprehensive backend services for inventory management, menu planning, order processing, and supplier coordination
- Efficient data manipulation and service management without the need for a frontend interface



## Usage

To use this project, clone the repository and ensure you have Vapor installed on your system. Set up a PostgreSQL database and configure the database connection in the project settings. Then, you can run the project locally and access the RESTful API endpoints using tools like Postman for testing and interaction.


## Required Tools 🛠️

Ensure you have the following tools downloaded:

 **Vapor**
 - [Vapor](https://docs.vapor.codes/install/macos/) is a powerful server-side Swift web framework tailored for building high-performance web applications and APIs. It provides developers with the tools needed to create robust backend solutions efficiently.

**Postman**
- [Postman](https://www.postman.com/downloads/) is a widely-used API development tool renowned for its capabilities in testing, documenting, and managing APIs. With Postman, developers can streamline the process of API testing and interaction.

**Postico 2**

- [Postico 2](https://eggerapps.at/postico2/) is a popular macOS PostgreSQL client known for its user-friendly interface. It simplifies the management and interaction with PostgreSQL databases, offering a visual interface for enhanced usability.

**PostgreSQL**

- [PostgreSQL](https://www.postgresql.org/download/) is an open-source relational database management system renowned for its advanced features and scalability. It is ideal for handling complex data storage and retrieval requirements, providing a reliable foundation for backend data management.


## Requirements 

Vapor 4 requires Swift 5.6 or greater.


## Tables and Relationships:

#### 1- Staff

| Parameter    | Type     | Description                |
| :--------    | :------- | :------------------------- |
| `id`         |   `UUID` |     **`PRIMARY KEY`**      |
| `name`       | `String` |                            |
| `salary`     | `Double` |                            |
| `phoneNumber`| `String` |                            |
| `role`       | `String` |                            |
| `canteen`    | `Canteen`|     **`FOREIGN KEY`**      |

Where Route 
```http
  http://127.0.0.1:8080/staff
```

| Request Method	  | Route   | Action                               |
| :--------------- | :------ | :----------------------------------  |
|  GET             |  /canteen/canteenId       | Returns all the Staff in Canteen     |
|  GET             |   /id   | Returns a Staff by ID                       |
|  POST            |         | Creates a new Staff                                      |
|  PUT             |         | Updates an existing Staff by ID                                        |
|  DELETE          |   /id   | Deletes an existing Staff item by ID.|




#### 2- Canteen

| Parameter    | Type     | Description                |
| :--------    | :------- | :------------------------- |
| `id`         |   `UUID` |       **`PRIMARY KEY`**    |
| `schoolName` | `String` |                            |
| `capacity`   | `Int`    |                            |
| `location`   | `String` |                            |

Where Route 
```http
  http://127.0.0.1:8080/canteens
```

| Request Method	  | Route | Action                                |
| :--------------- | :-----| :------------------------------------ |
|  GET             |       | Returns a list of all Canteen         |
|  GET             |   /id | Returns a Canteen by ID       |
|  POST            |       | Creates a new Canteen List            |
|  PUT             |       | Updates an existing Canteen by ID     |
|  DELETE          |   /id | Deletes an existing Canteen by ID     |



#### 3- Item

| Parameter | Type     | Description                 |
| :-------- | :------- | :-------------------------  |
| `id`      |   `UUID` |       **`PRIMARY KEY`**     |
| `name`    | `String` |                             |
| `price`   | `Double` |                             |

Where Route 
```http
  http://127.0.0.1:8080/items
```

| Request Method	  | Route | Action                                |
| :--------------- | :-----| :------------------------------------ |
|  GET             |       | Returns a list of all Items           |
|  GET             |   /id | Returns a list of Items by ID         |
|  POST            |       | Creates a new Item               |
|  PUT             |       | Updates an existing Item by ID        |
|  DELETE          |   /id | Deletes an existing Items by ID     |




#### 4- Items In Canteen

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `id`      |   `UUID` |       **`PRIMARY KEY`**    |
| `quantity`| `Int`    |                            |
| `item`    | `Item`   |       **`FOREIGN KEY`**    |
| `canteen` | `Canteen`|       **`FOREIGN KEY`**    |

Where Route 
```http
  http://127.0.0.1:8080/itemsInCanteen
```

| Request Method	  | Route  | Action                                          |
| :--------------- | :-----| :------------------------------------            |
|  GET             |       | Returns a list of all Items In Canteen           |
|  GET             |   /id | Returns a list of Items In Canteen by ID         |
|  POST            |       | Creates a new Items In Canteen List              |
|  PUT             |       | Updates an existing Items In Canteen by ID       |
|  DELETE          |   /id | Deletes an existing Items In Canteen by ID.      |

example 
<img width="843" alt="Screenshot 1445-08-16 at 2 22 04 PM" src="https://github.com/RazanAlabdulkarim/CanteenHub/assets/95241727/a3af5a9d-f65d-43d9-9e60-3c73e506253a">

## Authors

| Authors        |    Content 🔗                                   |
| -------------- |------------------------------------------------ |
|**Razan Alabdulkarim**| [![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/razan-alabdulkarim?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app)|
|**Alhanouf Alhamied**| [![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/alhanoufalhamied)|
|**Sara Almashharawi**| [![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/sara-almashharawi/?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app)|


