# README

Schema documentation:
https://github.com/maggiemunoz/CabanasYa/tree/main/docs/schema_documentation.pdf

How to run the app locally

You'll need Rails version 5.2+ and Ruby version 2.6+

    Git clone https://github.com/maggiemunoz/CabanasYa.git

create .env file in the root of the repository with the following format

    DB_USER=xx
    DB_PASSWORD=xx
    DEFAUL_USER_PASS=xx
    GOOGLE_CLIENT_ID=xx
    GOOGLE_CLIENT_SECRET=xx
    GMAIL_ADDRESS=cabanasyacorreo@gmail.com
    GMAIL_PASSWORD=xx

contact maggie.munoz@uc.cl for the specific passwords 

run

    rails db:create db:migrate db:seed

    Bundle install

    npm i

Or you can go to:

https://cabanasya.herokuapp.com