
# Furnished Flat Rental Marketplace (Ruby on Rails)

FlatRent is a web application that allows users to rent furnished flats from private owners. Users can browse through different types of flats, such as studios, apartments, lofts, etc., and see their details, such as location, price, amenities, and availability. Users can also contact the owners and request to rent a flat for a specific period of time. Owners can accept or decline the requests and manage their rentals.

## How to use it

To use FlatRent, you need to have Ruby on Rails installed on your machine. You can follow the instructions here: https://guides.rubyonrails.org/getting_started.html

You also need to have a Heroku account and the Heroku CLI installed. You can follow the instructions here: https://devcenter.heroku.com/articles/heroku-cli

To run FlatRent locally, follow these steps:

- Clone this repository to your local machine: `git clone git@github.com:AlirezaHabibi2010/rails-flat-marketplace.git`
- Change to the project directory: `cd rails-flat-marketplace`
- Install the dependencies: `rails active_storage:install`
- Create the database: `rails db:create`
- Run the migrations: `rails db:migrate`
- Seed the database with some sample data: `rails db:seed`
- Start the server: `rails server`
- Open your browser and go to http://localhost:3000

To deploy FlatRent to Heroku, follow these steps:

- Log in to your Heroku account: `heroku login`
- Create a new app on Heroku: `heroku create`
- Push your code to Heroku: `git push heroku master`
- Install the dependencies:
  ```sh
   heroku run  rails active_storage:install
  ```
- Run the migrations on Heroku: `heroku run rails db:migrate`
- Open your app on Heroku: `heroku open`

## Usage

Once the Furnished Flat Rental Marketplace is deployed, users can perform the following actions:

- **Sign Up**: Create a new account to access the marketplace.
- **Browse Listings**: Explore the available furnished flats for rent.
- **Create Listings**: List your furnished flats for others to rent.
- **Book Flats**: Rent a furnished flat by selecting the desired dates and completing the booking process.
- **Manage Bookings**: As a host, manage and confirm incoming booking requests.
- **Leave Reviews**: Share your experiences by leaving reviews for rented flats.

## Benefits

The Furnished Flat Rental Marketplace offers several benefits to users:

- **Convenience**: Users can easily find and rent furnished flats, streamlining the rental process.
- **Flexibility**: Hosts have the freedom to list their flats and manage bookings according to their preferences.
- **Trust and Transparency**: The marketplace promotes trust and transparency through user reviews and verified listings.
- **Cost-Effective**: Renting furnished flats can be more cost-effective than traditional accommodations, especially for short-term stays.
- **Community Building**: The platform fosters a community of renters and hosts, facilitating connections and interactions.

By utilizing the Furnished Flat Rental Marketplace, users can enjoy a seamless rental experience and find suitable accommodation for their needs.

## Contributing

If you would like to contribute to the Furnished Flat Rental Marketplace, feel free to submit pull requests or raise issues in the repository. Your contributions are welcome and will help improve the platform for everyone.

## How can anyone benefit from this code

Anyone who wants to learn how to build a web application using Ruby on Rails can benefit from this code. This code demonstrates how to use various features and concepts of Rails, such as:

- Models, views, controllers, and routes
- Active Record associations and validations
- Forms and form helpers
- Partials and layouts
- Authentication and authorization
- Flash messages and redirects
- Image uploading and processing
- Pagination and search
- User registration and profile editing
- User ratings and reviews
- Flat categories and filters
- Google Maps integration for flat locations

Anyone who wants to improve or extend this code can also benefit from it. Some possible features that can be added are:

- create chat between renter and owner
- Payment integration for flat rentals
- Notifications and reminders for owners and users
- Action Mailer and email templates
- Testing with RSpec and Capybara






