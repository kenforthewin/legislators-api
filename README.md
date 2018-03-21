# README

This app serves as an example backend for [redux-remote-datatable](https://github.com/kenforthewin/react-redux-datatable).

## Start dev server

Ensure docker-compose is installed and the docker daemon is running. After cloning the repo, navigate to its folder and run `docker-compose up`. The app will be served at `localhost:3001`.

## Seed the database

Within the rails container, run `rake db:seed`.

## Endpoints

There is currently only one endpoint.

- `POST /legislators`

### Example Request

```json
{
  "draw": 1,
  "page": 1,
  "perPage": 10,
  "sortField": null,
  "sortDirection": "asc",
  "searchValue": ""
}
```

### Example Response

```json
{
    "draw": "1",
    "totalRecords": 473,
    "data": [
        {
            "id": 52,
            "official_name": "Roy Blunt",
            "thomas_id": "01464",
            "birthday": "1950-01-10"
        },
        {
            "id": 51,
            "official_name": "Richard Blumenthal",
            "thomas_id": "02076",
            "birthday": "1946-02-13"
        },
        ...
    ]
}
```
