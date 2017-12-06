# README



RUBY
* download Ruby version 2.2.6



STRIPE
* create a free Stripe account: https://stripe.com/ca

* go to your dashboard and find out your...
	- test publishable_key: 'pk_test_somekey' 
	- test secret_key:  'sk_test_somekey'



GET THE APP RUNNING
* unzip the app file, place it anywhere, open your terminal in that directory

* run 'bundle install' to install all the gem files

* boot the app with your Stripe credentials:
     in the Terminal run...
     PUBLISHABLE_KEY=pk_test_somekey \\ SECRET_KEY=sk_test_somekey bundle exec rails s

* run 'rails server' to get the website running locally
* type in 'localhost:300' in your browser to see the web app

TEST THE PAYMENT FORM
* use any email address with a valid syntax ex: something@gmail.com
* use the test card: "4242 4242 4242 4242"
* use any valid expiration date that occurs in the future
* type any 3 digit CVC ex: 123


