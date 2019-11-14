FROM ruby:2.6.5-alpine3.10

RUN apk add --update --no-cache build-base git
#RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ v0.9.13
RUN gem install -N rubocop rubocop-rails rubocop-performance rubocop-rspec rubocop-i18n rubocop-rake

COPY entrypoint.sh /entrypoint.sh
COPY bin/reviewdog /bin/reviewdog

ENTRYPOINT ["/entrypoint.sh"]