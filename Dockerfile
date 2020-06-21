# Dockerfile
# Use ruby image to build our own image
FROM ruby:2.6
# We specify everything will happen within the /app folder inside the container
WORKDIR /app
RUN apt-get update
RUN apt-get install -y yarn
# We copy these files from our current application to the /app container
COPY Gemfile Gemfile.lock ./
# We install all the dependencies
# Install Bundler Version
RUN gem install bundler:2.1.4
RUN bundle install
RUN yarn
# We copy all the files from our current application to the /app container
COPY . .
# We expose the port
EXPOSE 3000
# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]