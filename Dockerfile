# Dockerfile
# Use ruby image to build our own image
FROM ruby:2.6
# We specify everything will happen within the /app folder inside the container
WORKDIR /app
# YARN repository
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Convention to use update and install on same line to actually install new packages
# We also use the line separation to make this easier to change
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  nodejs \
  yarn

# We copy these files from our current application to the /app container
COPY Gemfile Gemfile.lock ./
COPY package.json .
RUN yarn

# We install all the dependencies
# Install Bundler Version
RUN gem install bundler:2.1.4
RUN bundle install
# We copy all the files from our current application to the /app container
COPY . .

# We expose the port
EXPOSE 3000
# Start the main process.
CMD ["sh", "./entrypoint.sh"]