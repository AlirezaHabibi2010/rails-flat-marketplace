
# Furnished Flat Rental Marketplace (Ruby on Rails)

Welcome to the Furnished Flat Rental Marketplace! This platform allows users to rent furnished flats and facilitates the rental process. This Readme.md file provides instructions on how to deploy the application on Heroku and how to use the marketplace.

## Deployment on Heroku

To deploy the Furnished Flat Rental Marketplace on Heroku, follow these steps:

1. Clone the repository to your local machine using the following command:

```sh
git clone git@github.com:AlirezaHabibi2010/rails-flat-marketplace.git
```

2. Navigate to the project's directory:

```sh
cd furnished-flat-rental-marketplace
```

3. Create a new Heroku application:

```sh
heroku create [app_name]
```


4. Push the code to Heroku:

```sh
git push heroku master
```


5. Install active_storage, migrate the database, and run any necessary tasks:

```sh
heroku run rails active_storage:install
heroku run rails db:migrate
```


6. Your Furnished Flat Rental Marketplace is now deployed on Heroku. Access it by visiting the provided Heroku URL.

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

## License

The Furnished Flat Rental Marketplace is released under the [MIT License](LICENSE).







