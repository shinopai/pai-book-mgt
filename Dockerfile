FROM ruby:3.1

RUN mkdir /pai-book-mgt
WORKDIR /pai-book-mgt
COPY Gemfile /pai-book-mgt/Gemfile
COPY Gemfile.lock /pai-book-mgt/Gemfile.lock

# node関連インストール
RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y nodejs yarn

# Bundlerの不具合対策(1)
RUN gem update --system
RUN bundle update --bundler

RUN bundle install
COPY . /pai-book-mgt

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
