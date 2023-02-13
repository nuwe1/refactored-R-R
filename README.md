# Ruby on Rails developer - Coding Challenge

This is a vanilla Ruby on Rails application that will be used as part of demonstration of Ruby on Rails developer skills.

The following instructions is the recommended way to get the application up and
running for development. However, feel free to setup the application according
to your experience and comfort level.

The quickest way to get started is to download and install the
[Docker Desktop](https://www.docker.com/products/docker-desktop) application.
Once you have Docker setup and running locally, you can proceed with the
following setup instructions.

## Setup

1. Clone the repo.
   ```
   git clone gitgit@github.com:nuwe1/refactored-R-R.git.

   ```

2. Build the docker container.
   ```
   docker-compose build
   ```

3. Setup the database.
   ```
   docker-compose run --rm app bin/rails db:setup
   ```

4. Start the application.
   ```
   docker-compose up
   ```

5. The application should now be available by visiting: http://localhost:3000

## The Challenge

This sample application is a basic website that contains a list of articles
that can be viewed. The admin can be used to edit and delete these articles.
Your challenge is to enhance this website with a new "Ratings and Review"
feature. The idea is that when visitors finish reading an article, they'll be
presented with a form that will allow them to rate the article, as well as
leave a detailed review or comments for that article. This information can then
be displayed on the article page.

### Requirements

* Display a form when viewing an individual article. This form should include a
  field for a name, a dropdown, and a body of text.
* The dropdown will be used as the rating with a value of 1 to 10, 10 being the
  best rating.
* When a rating and review is submitted, the information should be stored in
  the database.
* An average rating should be displayed on the article page.
* The list of comments should be displayed on the article page along with the
  name of the person who submitted. The list should be displayed in
  chronological order.

### Milestones

We understand that these challenges can be overwhelming. It may be easier for
you to break down the challenge into "milestones". You can submit each
milestone individually, or submit everything all at once, it is up to you.

1. Generate the ActiveRecord model to store the ratings and reviews.
2. Implement the form and controller/action to save the data.
3. Display back the submitted ratings and reviews for each article.
4. Build an admin interface to manage (remove) ratings and reviews.
5. Add a feature to allow the admin to approve or reject ratings and reviews.

## Expectations

All submissions should be written clearly and concisely. Full test coverage is
not expected, but important logic should be covered. The requirements are
loosely defined on purpose. Feel free to expand and focus on areas where you
feel you can highlight your best strengths.

This exercise should take no more than 10 hours and you can use as little or as
much of that time as you need.

## Submissions

To submit your application, create branches with your changes and push them to
GitHub. Open a "Pull Request" to have your new branch merged into `trunk`. We'll
review your submissions based on those PRs.

Feel free to use the PRs to make your own comments as needed. For example, you
can create a comment to point out specific areas of the code your are proud of
or point to something that requires more attention.

## Review

Our review will be based on the following criteria:

* well reasoned code implementations
* effective communication (through discussions, comments, and code)
* satisfaction of requirements

## Asking for Help

Please do! Development is a collaborative effort and back and forth
communication is part of it. Feel free to contact us with any questions or
clarifications needed.

## Troubleshouting and testing

Docker is set to development environment by default and running test within the folder my cause
lead to loss of all the data created by the db/seed file. The safe way to run tests is within the
test environment and in order to do so follow the steps below

1. Start the application.

   ```
   docker-compose up
   ```

2. Create the test database and run migrations on it.

   ```
   docker-compose run -e "RAILS_ENV=test" app rake db:create db:migrate
   ```

3. Now run the all backend tests cases.

   ```
   docker-compose run -e "RAILS_ENV=test" app rails test
   ```

4. To run individual Tests.

   ```
   docker-compose run -e "RAILS_ENV=test" app rspec spec/path/to/spec.rb
   ```

**Note** All ruby tests are run with rspec and frontend/javascript tests are run with
jest. all you need to do is run the commands below

1.  To run all frontend/javascript tests.

  ```
  yarn test
  ```

2. To run individual test cases.

   ```
   yarn test  spec/javascript/path/to/spec.js
   ```

## Additional Resources

* [Docker](https://www.docker.com)
* [Rails Guides](https://guides.rubyonrails.org)
* [Bulma](https://bulma.io)
