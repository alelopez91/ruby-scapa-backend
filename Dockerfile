# Use the official Ruby image as the base image
FROM ruby:latest

# Set the working directory in the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock to the container
COPY Gemfile ./

# Install project dependencies
RUN bundle install

# Copy the rest of the application code to the container
COPY . .

# Expose port 3000 for the Rails server
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
