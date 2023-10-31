# README
Hi! Thank you for this opportunity. I enjoyed it very much and learned a lot. I hope this test is what you are looking for.

## Description
This time, I first identified all the essential functions before development and tried to make the application as simple and lean as possible. There were many features I would have liked to add if I had as much time as possible, but based on the importance of starting small and the fact that time is finite, I decided on this implementation. I was also conscious of writing tests well and making the code easy to read in the limited time available.

There are two main areas for further improvement. The first is to create an income and expenditure statement for the logged-in user after user authentication, so that only data focused on the target user is displayed. The second is to allow users to add and define their income and expenditure at present, but also to delete them. I believe that the user experience could be further improved by adding an index to the added income and expenditure and allowing only the added forms to be deleted.

If you have any questions, please let me know. Thank you for reading this far.

## How to run the web app locally
Ruby 3.2.2 & Rails 7.0.8

1. git clone git@github.com:Kazuho-Shibuya/take-home-test.git
2. cd take-home-test
3. bundle install
4. rails db:create
5. rails db:migrate
6. rails db:seed
7. bin/dev
8. open http://localhost:3000/
