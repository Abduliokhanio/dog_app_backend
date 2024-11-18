# Dockerfile
FROM ruby:3.3.0

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    npm \
    curl

# Install Yarn from its official repository
RUN npm install -g yarn@^1

# Install Webpack and Webpack CLI globally
RUN npm install -g webpack webpack-cli

# Set working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the rest of the application code
COPY . .

# Precompile assets for production
RUN RAILS_ENV=production bundle exec rake assets:precompile

# Expose the application port
EXPOSE 3000

# Start the Rails server
CMD ["sh", "-c", "rm -f /app/tmp/pids/server.pid && bin/rails server -b 0.0.0.0"]
