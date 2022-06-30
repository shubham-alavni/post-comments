# Rails api app for creating Post, Comments

## Stack Used

 - Ruby - 2.7.0
 - Rails - 6.0.5
 - MySQL - 8.0.29

## References Used

 - https://github.com/waiting-for-dev/devise-jwt
 - https://enlear.academy/how-to-create-a-rails-6-api-with-devise-jwt-46fa35085e85

## Gems

 - `devise`
 - `devise-jwt`
 - `dotenv-rails`

## Setup

`git clone https://github.com/shubham-alavni/post-comments.git`

````
bundle
rails db:create
rails db:migrate
````

## Token for Authenticate APIs (not required for Signup and login)

 - Use given token in Headers **Authorization**

`Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjU2NTU1MDQzLCJleHAiOjE2NTc4NTEwNDMsImp0aSI6IjY4YWEyMThlLTBiNjAtNDQ5ZS04ZWRlLWM5MTQzZGNiMjcxZCJ9.qpEipGz6DQMLJ7Sg2JawKT7_9K_-0pbreD-cT7oGm6Y`

 - `Content-Type: application/json`

# APIs (cURL)


## Sign Up (POST)
 - `curl --location --request POST 'http://localhost:3000/users' \
--header 'Content-Type: application/json' \
--data-raw '{
    "user":{
        "email": "rafel@mailnator.com",
        "password": "mypassword"
    }
}'`

## Sign In (POST)

 - `curl --location --request POST 'http://localhost:3000/users/sign_in' \
--header 'Content-Type: application/json' \
--data-raw '{
    "user":{
        "email": "rafel@mailnator.com",
        "password": "mypassword"
    }
}'`

## Create Post (POST)

 - `curl --location --request POST 'http://localhost:3000/api/v1/posts' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjU2NTU1MDQzLCJleHAiOjE2NTc4NTEwNDMsImp0aSI6IjY4YWEyMThlLTBiNjAtNDQ5ZS04ZWRlLWM5MTQzZGNiMjcxZCJ9.qpEipGz6DQMLJ7Sg2JawKT7_9K_-0pbreD-cT7oGm6Y' \
--data-raw '{
    "post": {
        "title": "Demo Title",
        "content": "Demo Content"
    }
}'`

## Create Comment (POST)

 - `curl --location --request POST 'http://localhost:3000/api/v1/posts/1/comments' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjU2NTU1MDQzLCJleHAiOjE2NTc4NTEwNDMsImp0aSI6IjY4YWEyMThlLTBiNjAtNDQ5ZS04ZWRlLWM5MTQzZGNiMjcxZCJ9.qpEipGz6DQMLJ7Sg2JawKT7_9K_-0pbreD-cT7oGm6Y' \
--data-raw '{
    "comment": {
        "body": "Demo Comment"
    }
}'`

## Reply over Comment (POST)

 - `curl --location --request POST 'http://localhost:3000/api/v1/1/reply_to_comment' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjU2NTU1MDQzLCJleHAiOjE2NTc4NTEwNDMsImp0aSI6IjY4YWEyMThlLTBiNjAtNDQ5ZS04ZWRlLWM5MTQzZGNiMjcxZCJ9.qpEipGz6DQMLJ7Sg2JawKT7_9K_-0pbreD-cT7oGm6Y' \
--data-raw '{ "reply": { "body": "Demo Reply" } }'`

## Get all Posts (GET)

 - `curl --location --request GET 'http://localhost:3000/api/v1/posts' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjU2NTU1MDQzLCJleHAiOjE2NTc4NTEwNDMsImp0aSI6IjY4YWEyMThlLTBiNjAtNDQ5ZS04ZWRlLWM5MTQzZGNiMjcxZCJ9.qpEipGz6DQMLJ7Sg2JawKT7_9K_-0pbreD-cT7oGm6Y' \
--data-raw ''`

## Api to return all posts by user (GET)

 - `curl --location --request GET 'http://localhost:3000/api/v1/posts?user_id=1' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjU2NTU1MDQzLCJleHAiOjE2NTc4NTEwNDMsImp0aSI6IjY4YWEyMThlLTBiNjAtNDQ5ZS04ZWRlLWM5MTQzZGNiMjcxZCJ9.qpEipGz6DQMLJ7Sg2JawKT7_9K_-0pbreD-cT7oGm6Y' \
--data-raw ''`

## Api to return all posts by any user, api should also be able to sort by number of comments (GET)

 - `curl --location --request GET 'http://localhost:3000/api/v1/posts?user_id=1&sort_by=comments' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjU2NTU1MDQzLCJleHAiOjE2NTc4NTEwNDMsImp0aSI6IjY4YWEyMThlLTBiNjAtNDQ5ZS04ZWRlLWM5MTQzZGNiMjcxZCJ9.qpEipGz6DQMLJ7Sg2JawKT7_9K_-0pbreD-cT7oGm6Y' \
--data-raw ''`

## Find the Post with Max Comments (GET)

 - `curl --location --request GET 'http://localhost:3000/api/v1/posts_with_max_comments' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjU2NTU1MDQzLCJleHAiOjE2NTc4NTEwNDMsImp0aSI6IjY4YWEyMThlLTBiNjAtNDQ5ZS04ZWRlLWM5MTQzZGNiMjcxZCJ9.qpEipGz6DQMLJ7Sg2JawKT7_9K_-0pbreD-cT7oGm6Y' \
--data-raw ''`

## Find the Users who has commented most (GET)

 - `curl --location --request GET 'http://localhost:3000/api/v1/most_commented_users' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjU2NTU1MDQzLCJleHAiOjE2NTc4NTEwNDMsImp0aSI6IjY4YWEyMThlLTBiNjAtNDQ5ZS04ZWRlLWM5MTQzZGNiMjcxZCJ9.qpEipGz6DQMLJ7Sg2JawKT7_9K_-0pbreD-cT7oGm6Y' \
--data-raw ''`



# SQL Queries

## Find the Post with Max Comments

 - **SQL Query**

    SELECT posts.id as Post_id, posts.title as Title, COUNT(comments.id) AS comments_count  FROM posts INNER JOIN comments ON comments.post_id = posts.id GROUP BY posts.id

- **ActiveRecord Statement**

    Post.select("posts.*, COUNT(comments.id) comment_count").joins(:comments).group("posts.id").order("comment_count DESC")

## Find the Users who has commented most

 - **SQL Query**

    SELECT users.id as user_id, COUNT(comments.id) comment_count FROM users INNER JOIN comments ON comments.user_id = users.id GROUP BY users.id ORDER BY comment_count DESC

- **ActiveRecord Statement**

    User.select("users.id as user_id, COUNT(comments.id) comment_count").joins(:comments).group("users.id").order("comment_count DESC")
