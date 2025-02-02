# README

# ror_react_referral

This is a Ruby on Rails API application with user authentication using Devise and DeviseTokenAuth. It allows users to sign up, log in, and send referrals.

## Setup

### Prerequisites

- Ruby 3.2.6
- Rails 7.2.2.1
- PostgreSQL

### Getting Started

1. Clone this repository:

   git clone https://github.com/koushikapriyanka/ror_react_referral.git
   cd ror_react_referral

2. Install dependencies:

	bundle install

3.Set up the database:
	rails db:create
	rails db:migrate

4.Start the Rails server:
	rails server
	
The API will be running on http://localhost:3000.
For mail testing, visit http://localhost:1080.


For Frontend

1. cd client
2. npm install
3. npm start


Pages

Sign Up Page: http://localhost:3001/signup
Login Page: http://localhost:3001/login
Referral Page: http://localhost:3001/referral

