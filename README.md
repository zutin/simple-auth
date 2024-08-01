# Simple Auth

## Introduction

A simple Ruby on Rails authentication API using devise-token-auth and PostgreSQL

<p align="center">
  <a href="https://www.ruby-lang.org/">
    <img src="https://img.shields.io/badge/ruby-3.3.4-%23CC0000.svg?style=for-the-badge&logo=ruby&logoColor=white"/>
  </a>
  <a href="https://rubyonrails.org/">
    <img src="https://img.shields.io/badge/Ruby%20On%20Rails%20-7.1.3.4-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white"/>
  </a>
  <a href="https://www.postgresql.org/">
    <img src="https://img.shields.io/badge/PostgreSQL-14.12-316192?style=for-the-badge&logo=postgresql&logoColor=white">
  </a>
</p>

## Project development
Gems used for development:

- <a href="https://github.com/lynndylanhurley/devise_token_auth">devise-token-auth</a> for API authentication
- <a href="https://github.com/rspec/rspec-rails">RSpec</a> for tests/specs
- <a href="https://github.com/rubocop/rubocop">Rubocop</a> for lint
- <a href="https://github.com/cyu/rack-cors">Rack-CORS</a> for cross-origin resource sharing

## Requirements

To run the application, you need to install Ruby ~> 3.3.4 and Rails ~> 7.1.3, you'll also need to install PostgreSQL ~> 14

## Installation

1. Clone this repository to your local machine:

```bash
git clone git@github.com:zutin/simple-auth.git
```

2. Navigate to the project directory:

```bash
cd simple-auth
```

3. Install the project dependencies:

```bash
bundle install
```

4. Create the database:

```bash
rails db:create
```

5. Run the database migrations:

```bash
rails db:migrate
```

**FYI:** It is *highly recommended* to run the application tests using *RSpec* after installing so you can make sure everything is working fine.

6. Start local server using another port:

```bash
rails server -p 4000
```

7. Access the application at:

```bash
http://localhost:4000
```

## How to run tests/specs

You can run tests by navigating to the project folder:
```bash
cd simple-auth
```
And using *RSpec* to run all tests:
```bash
rspec
```

## API Documentation
### Employee
##### Employee attributes
| Attribute | Type |
|:---:|:---:|
| id | Integer |
| provider | String |
| uid | String |
| email | String |
| created_at | Datetime |
| updated_at | Datetime |

### `(GET /employees)` - Returns all employees

**HTTP Request**
- Header
```bash
  Authorization: Bearer [access_token]
```
- Endpoint
```bash
http://localhost:4000/employees
```

**Response - if authenticated**
```bash
HTTP/1.0 200 OK
Content-Type: application/json
[
    {
        "id": 1,
        "provider": "email",
        "uid": "test@mail.com",
        "email": "test@mail.com",
        "created_at": "2024-08-01T18:20:32.383Z",
        "updated_at": "2024-08-01T18:20:32.546Z"
    }
]
```

**Response - if not authenticated**
```bash
HTTP/1.0 401 Unauthorized
Content-Type: application/json
{
    "errors": [
        "You need to sign in or sign up before continuing."
    ]
}
```

### `(POST /auth/sign_in)` - Logs in and receives an access token

**HTTP Request**
- Body
```bash
{
    "email": "test@mail.com",
    "password": "password"
}
```
- Endpoint
```bash
http://localhost:4000/auth/sign_in
```

**Response - if it successfully logs in**
- Headers
```bash
  access-token: mzaWvXr3zMFpTTCOHTNIeQ
  token-type: Bearer
  client: tl3EhH7yIBTOO7MURHAEkA
  uid: test@mail.com
  authorization: Bearer eyJhY2Nlc3MtdG9rZW4iOiJtemFXdlhyM3pNRnBUVENPSFROSWVRIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6InRsM0VoSDd5SUJUT083TVVSSEFFa0EiLCJleHBpcnkiOiIxNzIzNzQ2MzU2IiwidWlkIjoidGVzdDFAdGVzdC5jb20ifQ==
```
- Body
```bash
HTTP/1.0 200 OK
Content-Type: application/json
{
    "data": {
        "email": "test@mail.com",
        "provider": "email",
        "uid": "test@mail.com",
        "id": 1
    }
}
```

**Response - if it fails to log in**
- Body
```bash
HTTP/1.0 401 Unauthorized
Content-Type: application/json
{
    "success": false,
    "errors": [
        "Invalid login credentials. Please try again."
    ]
}
```

### `(DELETE /auth/sign_out)` - Signs out of the current account

**HTTP Request**
- Headers
```bash
  access-token: mzaWvXr3zMFpTTCOHTNIeQ
  token-type: Bearer
  client: tl3EhH7yIBTOO7MURHAEkA
  uid: test@mail.com
  authorization: Bearer eyJhY2Nlc3MtdG9rZW4iOiJtemFXdlhyM3pNRnBUVENPSFROSWVRIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6InRsM0VoSDd5SUJUT083TVVSSEFFa0EiLCJleHBpcnkiOiIxNzIzNzQ2MzU2IiwidWlkIjoidGVzdDFAdGVzdC5jb20ifQ==
```
- Endpoint
```bash
http://localhost:4000/auth/sign_out
```

**Response - if it successfully signs out**
- Body
```bash
HTTP/1.0 200 OK
Content-Type: application/json
{
    "success": true
}
```

**Response - if it fails to sign out**
- Body
```bash
HTTP/1.0 404 Not Found
Content-Type: application/json
{
    "success": false,
    "errors": [
        "User was not found or was not logged in."
    ]
}
```

### `(POST /auth/sign_up)` - Creates a new employee

**HTTP Request**
- Body
```bash
{
    "email": "test@mail.com",
    "password": "password"
}
```
- Endpoint
```bash
http://localhost:4000/auth/sign_up
```

**Response - if it successfully creates a new employee**
- Headers
```bash
  access-token: mzaWvXr3zMFpTTCOHTNIeQ
  token-type: Bearer
  client: tl3EhH7yIBTOO7MURHAEkA
  uid: test@mail.com
  authorization: Bearer eyJhY2Nlc3MtdG9rZW4iOiJtemFXdlhyM3pNRnBUVENPSFROSWVRIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6InRsM0VoSDd5SUJUT083TVVSSEFFa0EiLCJleHBpcnkiOiIxNzIzNzQ2MzU2IiwidWlkIjoidGVzdDFAdGVzdC5jb20ifQ==
```
- Body
```bash
HTTP/1.0 200 OK
Content-Type: application/json
{
    "status": "success",
    "data": {
        "email": "test@mail.com",
        "provider": "email",
        "uid": "test@mail.com",
        "id": 1,
        "created_at": "2024-08-01T18:20:32.383Z",
        "updated_at": "2024-08-01T18:20:32.546Z"
    }
}
```

**Response - if it fails to create a new employee**
- Body
```bash
HTTP/1.0 422 Unprocessable Content
Content-Type: application/json
{
    "status": "error",
    "data": {
        "id": null,
        "provider": "email",
        "uid": "",
        "email": "test@mail.com",
        "created_at": null,
        "updated_at": null
    },
    "errors": {
        "email": [
            "has already been taken"
        ],
        "full_messages": [
            "Email has already been taken"
        ]
    }
}
```
