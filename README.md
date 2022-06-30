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

    SELECT posts.id, posts.title, Count(comments.id) as comment_count FROM posts INNER JOIN comments ON comments.post_id = posts.id GROUP BY comments.post_id ORDER BY count(comments.post_id) desc

- **ActiveRecord Statement**

    Post.joins(:comments).group('comments.post_id').order('count(comments.post_id) desc').select('posts.id, posts.title, Count(comments.id) as 
comment_count')

## Find the Users who has commented most

 - **SQL Query**

    SELECT user_id, count(id) as comments_count FROM comments GROUP BY comments.user_id

- **ActiveRecord Statement**

    Comment.group('user_id').select('user_id, count(id) as comments_count')
