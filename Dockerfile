FROM ruby:3.3-slim

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    default-libmysqlclient-dev \
    libvips \
    curl \
    git \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g yarn

WORKDIR /app

COPY Gemfile Gemfile.lock* ./
RUN bundle install

COPY . .

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]