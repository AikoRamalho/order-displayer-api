# Order Displayer Api
The order-displayer-api project was created in order to (ba dum ts) display restaurant's orders.
This is a Rest-API project with Rails.

## Getting Started

Clone this repo to start working.

### Prerequisites

You should run this Api in ruby 2.5.0 version, and rails 5.1.5.
To see your your ruby/rails version, run:

```
rails -v
ruby -v
```

### Installing

To install dependecies you should, after clone this repo, run:
```
bundle install
```
Once you install the gems, you can run:
```
rails -s
```
And everything should be working fine.



## Usage
Demo usage(I will use httpie for calls, but you can use anything you want)

```
http :3000/signup name=foo email=foo@bar.com password=foobar password_confirmation=foobar
```
This should return something like this:
```
{
    "auth_token": "yourAuthToken",
    "message": "Account created successfully"
}
```

With your auth token you can start posting:

```
http :3000/orders Authorization:'yourAuthToken'
```

This should return something like this:

```
HTTP/1.1 200 OK
Cache-Control: blabla
Content-Type: blablabla
ETag: W/"blablabala"
Transfer-Encoding: blablabla
X-Request-Id: blablabla
X-Runtime: blablabal
```

## Built With

* [JWT](https://github.com/jwt/ruby-jwt) - The Json Web Token framework
* [Bcrypt](https://github.com/codahale/bcrypt-ruby) - For keeping user's password secure.
* [Rspec](https://github.com/rspec/rspec-rails) - The test framework
* [Factory](https://github.com/thoughtbot/factory_bot_rails) - A fixtures replacement with a more straightforward syntax. 
* [ShouldaMatchers](https://github.com/thoughtbot/shoulda-matchers) - Provides RSpec with additional matchers.
* [DatabaseCleaner](https://github.com/DatabaseCleaner/database_cleaner) - Cleans our test database to ensure a clean state in each test suite.
* [Faker](https://github.com/stympy/faker) - A library for generating fake data.


## Versioning

I didn't use any framework for versioning, instead, I added a route constraint that select a version based on the request headers, and namespeced the controllers, in order to handle different versions. 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)
