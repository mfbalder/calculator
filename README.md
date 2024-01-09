# README

This `calculator` repo contains two endpoints:

* `calculate`, a POST endpoint that takes an operator and array of numbers and calculates the total
* `directory`, a GET endpoint that takes an optional `Calculation` ID and returns either the results from that calculation, or all calculations if no ID is passed.

## How to Run

### Requirements
* Ruby Version 3.0.6
* Rails Version 7.1.2

### Setup Steps
1. Clone this repo
2. Run migrations `bin/rails db:migrate`
3. Start up a rail server `bundle exec rails s`

### `/calculate`

#### Expected Inputs
* `operation` => `add`, `subtract`, `divide`, `multiply`
* `numbers` => An array of integers or floats (negative is fine, no strings)

#### Sample Local `curl` Request
`curl -X POST -d "operation=multiply&numbers=%5B1%2C2%2C3%5D" http://127.0.0.1:3000/calculate`

Where `operation` == `multiply` and `numbers` == `[1, 2, 3]`.

#### Example Output
`{"result":6,"status":200}`

### `/directory`

#### Expected (optional) Inputs
* `id` => The ID of the calculation record

#### Sample Local `curl` Request (with a passed ID)
`curl -X GET -d "id=2"  http://127.0.0.1:3000/directory`

#### Example Output 
`{"result":{"id":2,"operation":"add","numbers":[1,2,3],"total":6.0,"created_at":"2024-01-09T18:39:43.889Z","updated_at":"2024-01-09T18:39:43.889Z"},"status":200}`

#### Sample Local `curl` Request (with no passed ID)
`curl -X GET http://127.0.0.1:3000/directory`

#### Example Output
```{"result":[{"id":1,"operation":"add","numbers":"[1,2,3]","total":6.0,"created_at":"2024-01-09T18:38:36.479Z","updated_at":"2024-01-09T18:38:36.479Z"},{"id":2,"operation":"add","numbers":[1,2,3],"total":6.0,"created_at":"2024-01-09T18:39:43.889Z","updated_at":"2024-01-09T18:39:43.889Z"},{"id":3,"operation":"multiply","numbers":[1,2,3],"total":6.0,"created_at":"2024-01-09T18:40:17.628Z","updated_at":"2024-01-09T18:40:17.628Z"},{"id":4,"operation":"add","numbers":[1,2,3],"total":6.0,"created_at":"2024-01-09T19:17:59.792Z","updated_at":"2024-01-09T19:17:59.792Z"},{"id":5,"operation":"add","numbers":[1,2,3],"total":6.0,"created_at":"2024-01-09T19:46:05.199Z","updated_at":"2024-01-09T19:46:05.199Z"},{"id":6,"operation":"multiply","numbers":[1,2,3],"total":6.0,"created_at":"2024-01-09T19:47:13.501Z","updated_at":"2024-01-09T19:47:13.501Z"},{"id":7,"operation":"add","numbers":[1,2,3],"total":6.0,"created_at":"2024-01-09T19:51:17.448Z","updated_at":"2024-01-09T19:51:17.448Z"},{"id":8,"operation":"add","numbers":[1,2,3],"total":6.0,"created_at":"2024-01-09T19:59:21.622Z","updated_at":"2024-01-09T19:59:21.622Z"},{"id":9,"operation":"multiply","numbers":[1,2,3],"total":6.0,"created_at":"2024-01-09T20:24:18.736Z","updated_at":"2024-01-09T20:24:18.736Z"}],"status":200}```

## How to Run the Test Suite
`bundle exec rspec`

## About the DB Model
This repo contains a singular table, `calulcations`, with the follow columns:
```
operation, type: string, null: false,
numbers, type: JSON, null: false,
total, type: float, null: false,
created_at, type: DateTime,
updated_at, type: DateTime
```
