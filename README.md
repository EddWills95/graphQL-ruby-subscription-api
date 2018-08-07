Action Cable graphql-ruby subscription implementation.

There is an example floating around in a gist somewhere but it needed some updating to the newer class based syntax and there are a few modules/classes that rmsologo has changed in redeveloping it.

To Run:

- bundle install
- rails db:create db:migrate
- rails s

You should then be able to use GraphiQL or something to see that there is a subscription endpoint and a way to increment a counter.

I will finish off a web interface for this soon....
