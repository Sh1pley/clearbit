# Demo App using Clearbit and Plaid

## What works:
  - Ruby/Sinatra API with localhost:9292/api/test route to send test JSON transaction data
  - Front-end through rack-proxy
    - React base component from localhost:9292/
  - Webpack configuration
    - whole thing launched with: ``` rackup ```  (console)
      - ###### *must have weback-dev-server installed globally*
  - Unit testing for the Ruby/Sinatra side done in Minitest
    - ```rake test ``` (console) will run tests

## To do:
  - More tests (Front-end especially)
  - GET /api/test request is pretty slow, look into optimizing
  - Env variables used instead of Plaids Link API
    - *could add user sign in*

### Set up needed:
    
     CLEARBIT_KEY: sk_726d69****21b64fb
     PLAID_CLIENT_ID=5b2****2f6
     PLAID_SECRET=19b****258
     PLAID_PUBLIC_KEY=6c1****05fe80
     PLAID_ENV=sandbox
     PLAID_ACCESS_TOKEN=access-sandbox-****
    
PLAID_ACCESS_TOKEN is made through using Plaids Link service. 
###### * *for now this is done manually*
All other access keys are assigned through API signups on Clearbit and Plaid websites.

These should be added to a .env file in the projects root directory