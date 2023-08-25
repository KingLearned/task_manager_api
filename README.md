# Task Management Web Api Readme

Task Management API.
The README provides an overview of the API's functionality, how to set it up, and its available routes.

## Table of Contents

- [Description](#description)
- [Installation](#installation)
- [Usage](#usage)
- [API Routes](#api-routes)
- [Handlers](#handlers)

## Description

The Task Management API is a backend service that provides endpoints for managing tasks. It includes functionality for adding, retrieving, querying, updating, and deleting tasks associated with user authentication.

## Installation

To set up the API locally, follow these steps:

1. Clone the repository:

   ```bash
   git clone <repository-url>
   cd <project-directory>


## Installation and Usage

To start the development server and run the application, use the following command:
1. Clone the repository:
   git clone <repository-url>
2. Install all dependencies:
    npm install
3. To start the development server and run the application, use the following command:
    npm start

# Usage
You can use the API to manage tasks by sending HTTP requests to its routes. Make sure the server is running before making requests.

# API Routes
* POST /server/auth/register: User registration route.
* POST /server/auth/login: User login route.
* POST /server/tasks: Add a new task.
* GET /server/tasks: Retrieve tasks associated with a user.
* PUT /server/tasks/:id: Update a task by ID.
* DELETE /server/tasks/:id: Delete a task by ID.

# Handlers
## addTask
This handler adds a new task to the database. It requires authentication via a valid JSON Web Token (JWT) for authorization.

## getTasks
This handler retrieves tasks from the database based on the user ID. It supports searching for tasks by title if a search query is provided.

## updateTask
This handler updates a task in the database. It allows updating the title, note, and subtask fields of a task.

## deleteTask
This handler deletes a task from the database based on the provided task ID.