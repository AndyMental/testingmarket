Aleran Marketplace V3.0

DB: 
Development - sql lite default ruby arrangement
Production - Postgresql

production:
  <<: *default
  adapter: postgresql
  host: market-m3.postgres.database.azure.com
  port: 5432
  database: market3
  username: ruby19828@market-m3
  password: cJzsb98yqZ4Q

# host=market3ruby.postgres.database.azure.com; dbname={your_database} user=ruby19827@market3ruby password={your_password} port=5432 sslmode=require

Production API
  repdesk_token: "3AF0F445D4C5443A99E78127C06FD67D"
  api_url: "https://apps2.aleran.com/repdesk/api/market/"
  rep_group: nil


Market3 Product URL
  domain: "market3-30d9cee0-767f-4fab-ab55-577ae5e85f6e.azurewebsites.net"
