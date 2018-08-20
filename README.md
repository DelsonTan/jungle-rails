# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

!["Registration"](https://github.com/DelsonTan/jungle-rails/blob/master/app/assets/images/registration.png)
!["Login Page"](https://github.com/DelsonTan/jungle-rails/blob/master/app/assets/images/login.png)
!["Logged in"](https://github.com/DelsonTan/jungle-rails/blob/master/app/assets/images/logged_in.png)
!["Products"](https://github.com/DelsonTan/jungle-rails/blob/master/app/assets/images/products_with_ratings.png)
!["Product Page"](https://github.com/DelsonTan/jungle-rails/blob/master/app/assets/images/product_show.png)

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Login Credentials for Testing

username: jungle@book.com
password: admin

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
