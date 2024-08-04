# 🏨 Hotel API

Welcome to the Hotel API! This API allows you to manage various aspects of a hotel, including weather data, destinations, rooms, and users. Below are the available routes and their descriptions.

## 🔐 Authentication

### 🔑 Login
- **Endpoint:** `/v1/login`
- **Method:** POST
- **Description:** Authenticates a user.
- **Controller:** `AuthController::class`

### 📝 Register
- **Endpoint:** `/v1/register`
- **Method:** POST
- **Description:** Registers a new user.
- **Controller:** `AuthController::class`

### ✅ Verify
- **Endpoint:** `/v1/verify`
- **Method:** POST
- **Description:** Verifies a user's account.
- **Controller:** `AuthController::class`

## ☀️ Weathers

### 🌤️ Get All Weathers
- **Endpoint:** `/v1/weathers`
- **Method:** GET
- **Description:** Retrieves all weather data.
- **Controller:** `WeatherController::class`
- **Access:** owners

### ⛅ Get Weather by ID
- **Endpoint:** `/v1/weathers/{id}`
- **Method:** GET
- **Description:** Retrieves weather data by ID.
- **Controller:** `WeatherController::class`
- **Access:** owners

### 🌦️ Create Weather
- **Endpoint:** `/v1/weathers`
- **Method:** POST
- **Description:** Creates a new weather entry.
- **Controller:** `WeatherController::class`
- **Access:** owners

### 🌩️ Update Weather
- **Endpoint:** `/v1/weathers/{id}`
- **Method:** PUT
- **Description:** Updates a weather entry by ID.
- **Controller:** `WeatherController::class`
- **Access:** owners

### ❄️ Delete Weather
- **Endpoint:** `/v1/weathers/{id}`
- **Method:** DELETE
- **Description:** Deletes a weather entry by ID.
- **Controller:** `WeatherController::class`
- **Access:** owners

## 🏝️ Destinations

### 🌍 Get All Destinations
- **Endpoint:** `/v1/destinations`
- **Method:** GET
- **Description:** Retrieves all destinations.
- **Controller:** `DestinationController::class`
- **Access:** owners

### 📍 Get Destination by ID
- **Endpoint:** `/v1/destinations/{id}`
- **Method:** GET
- **Description:** Retrieves a destination by ID.
- **Controller:** `DestinationController::class`
- **Access:** owners

### 🗺️ Create Destination
- **Endpoint:** `/v1/destinations`
- **Method:** POST
- **Description:** Creates a new destination.
- **Controller:** `DestinationController::class`
- **Access:** owners

### 🌐 Update Destination
- **Endpoint:** `/v1/destinations/{id}`
- **Method:** PUT
- **Description:** Updates a destination by ID.
- **Controller:** `DestinationController::class`
- **Access:** owners

### 🏖️ Delete Destination
- **Endpoint:** `/v1/destinations/{id}`
- **Method:** DELETE
- **Description:** Deletes a destination by ID.
- **Controller:** `DestinationController::class`
- **Access:** owners

## 🛏️ Rooms

### 🏢 Get All Rooms
- **Endpoint:** `/v1/rooms`
- **Method:** GET
- **Description:** Retrieves all rooms.
- **Controller:** `RoomController::class`

### 🛋️ Get Room by ID
- **Endpoint:** `/v1/rooms/{id}`
- **Method:** GET
- **Description:** Retrieves a room by ID.
- **Controller:** `RoomController::class`

### 🛎️ Create Room
- **Endpoint:** `/v1/rooms`
- **Method:** POST
- **Description:** Creates a new room.
- **Controller:** `RoomController::class`
- **Access:** not accessible to guests

### 🔧 Update Room
- **Endpoint:** `/v1/rooms/{id}`
- **Method:** PUT
- **Description:** Updates a room by ID.
- **Controller:** `RoomController::class`
- **Access:** not accessible to guests

### 🗑️ Delete Room
- **Endpoint:** `/v1/rooms/{id}`
- **Method:** DELETE
- **Description:** Deletes a room by ID.
- **Controller:** `RoomController::class`
- **Access:** owners

### 👍 Like Room
- **Endpoint:** `/v1/rooms/like`
- **Method:** POST
- **Description:** Likes a room.
- **Controller:** `RoomController::class`

### 🛏️ Reserve Room
- **Endpoint:** `/v1/rooms/reserve`
- **Method:** POST
- **Description:** Reserves a room.
- **Controller:** `RoomController::class`

## 👥 Users

### 👤 Get All Users
- **Endpoint:** `/v1/users`
- **Method:** GET
- **Description:** Retrieves all users.
- **Controller:** `UserController::class`
- **Access:** admin, support

### 🆔 Get User by ID
- **Endpoint:** `/v1/users/{id}`
- **Method:** GET
- **Description:** Retrieves a user by ID.
- **Controller:** `UserController::class`

### ➕ Create User
- **Endpoint:** `/v1/users`
- **Method:** POST
- **Description:** Creates a new user.
- **Controller:** `UserController::class`
- **Access:** not accessible to guests

### 🔄 Update User
- **Endpoint:** `/v1/users/{id}`
- **Method:** PUT
- **Description:** Updates a user by ID.
- **Controller:** `UserController::class`
- **Access:** not accessible to guests

### ❌ Delete User
- **Endpoint:** `/v1/users/{id}`
- **Method:** DELETE
- **Description:** Deletes a user by ID.
- **Controller:** `UserController::class`
- **Access:** owners

## 🔧 Room Features

### ➕ Add Feature to Room
- **Endpoint:** `/v1/rooms/feature`
- **Method:** POST
- **Description:** Adds a feature to a room.
- **Controller:** `RoomController::class`
- **Access:** not accessible to guests

### ➕ Append Feature to Room
- **Endpoint:** `/v1/rooms/append_feature`
- **Method:** POST
- **Description:** Appends a feature to a room.
- **Controller:** `RoomController::class`
- **Access:** not accessible to guests


## Setup
```bash
composer install
```
---
The **delete this text.env.example** file rename it to **.env.example**
Then run 
```bash
cp .\.env.example .env
```
---

Replace `/restapi/hotel` with the URL you have for accessing the API ⚠️


---

# soon ...

- Admin panel 🔥
- project on frontend 🔥

**Sabzlearn api php course** ✅
