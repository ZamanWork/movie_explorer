# Movie Searcher Web Application

Welcome to the Movie Searcher web application! This is a simple Ruby on Rails application that allows users to search for movies and add them to our list of movies. Users can also rate and comment on movies they like.

## Getting Started

These instructions will help you set up the development environment and run the application on your local machine.

### Prerequisites

Make sure you have the following installed on your machine:

- Ruby 7.0.1 (You can use [rbenv](https://github.com/rbenv/rbenv) or [rvm](https://rvm.io/) for Ruby version management)
- PostgreSQL (for the database)
- Node.js (for asset compilation with esbuild)

### Installation

1. Clone the repository:

```bash
git clone https://github.com/ZamanWork/movie_explorer.git
cd movie-searcher
```

2. Install Ruby dependencies:

```bash
bundle install
```

3. Install JavaScript dependencies:
```bash
yarn install
```

4. Setup Database
```bash
rails db:create
rails db:migrate
```
### Running the Application
```bash
rails server
```
The application will be accessible at http://localhost:3000.

### Running Tests
```bash
bundle exec rspec
```

## Docker
Alternatively, you can run the application using Docker. Make sure you have Docker installed on your machine.

1. Build the Docker Image:
```bash
docker-compose build
```

2. Set up the database:
```bash
docker-compose run web rails db:create
```

3. Run the application:
```bash
docker-compose up
```

### How to Use
## Search for Movies:
Use the search bar on the homepage to search for movies by title or keywords.
The application will fetch movie details from a public API and display the search results.

### Add a Movie to Our List:
For a movie you like, click the "Add to Our Movies" button next to the search result.
The movie will be added to our list of movies.

### Rate and Comment on Movies:
On the movie show page, you can rate and comment on the movie.
Ratings are done on a scale of 1 to 10.

Enjoy using the Movie Searcher web application!
