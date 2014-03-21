# Tab Reader

Tab Reader is a simple application that takes a user-submitted file and parses
it into the relational database.

# Four models are created

1. Purchaser (name)
2. Item (description, price)
3. Merchant (address, name)
4. ItemsPurchaser (many-to-many associations between purchasers and items, and
   count)

# SQLite is used

Run `rake db:migrate` to set up SQLite. While running the server, upload the file,
and you will be taken to the results.

When you want to upload a new file for testing, you must run `rake db:reset`
to reset the database.
