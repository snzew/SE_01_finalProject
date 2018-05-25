import json
import psycopg2
import requests
import time

YOUR_API_KEY = 'AIzaSyBXjdtXavC504KMmySeshuhb3jWhvilwuo'


def main():
    global conn
    global cur

    # connecting to database and set cursor
    conn = psycopg2.connect("dbname=rmm user=postgres")
    cur = conn.cursor()

    # reading queries from query textfiel
    queries = get_queries("places.txt")

    # making google request for each query in textfile
    for query in queries:
        # else print query and stor it in database
        print(query)
        get_places(query)

    # closing communication to database
    cur.close()
    conn.close()


# getting queries from textfile
def get_queries(path):

    # reading queries line per line from textile
    with open(path) as textfile:
        queries = textfile.readlines()

    # removing the \n after each line
    queries = [x.strip() for x in queries]

    # print to command line for info
    print("reading queries from file")
    return queries


# requesting places from google api for each place
def get_places(query):

    # defining query parameters and input
    base_url = "https://maps.googleapis.com/maps/api/place/textsearch/json"
    parameters = {
        "key": YOUR_API_KEY,
        "query": query,
        "language": 'en',
    }

    print("requesting places for: ", query)


    response = requests.get(url=base_url, params=parameters)
    data = response.json()

    status = data.get("status")

    if status == "OVER_QUERY_LIMIT":
        print("_____over query limit____")
        print("daily limit has been reached!")
        return 0

    else:
        # for very place execute handle_place to inserting him into database
        results = data.get("results")
        for place in results:
            handle_place(query, place)



def handle_place(query, place):

    # insert place into database
    sql_command = """INSERT INTO places(query, google_place_id, name, rating, address, lat, lng, types)
    VALUES(%s, %s, %s, %s, %s, %s, %s, %s)
    ON CONFLICT (google_place_id)
    DO UPDATE SET name=%s, rating=%s, address=%s, lat=%s, lng=%s, types=%s RETURNING id"""

    sql_data = (
        query,
        place.get("place_id"),
        place.get("name"),
        place.get("rating"),
        place.get("formatted_address"),
        place.get("geometry", {}).get("location", {}).get("lat"),
        place.get("geometry", {}).get("location", {}).get("lng"),
        place.get("types"),
        place.get("name"),
        place.get("rating"),
        place.get("formatted_address"),
        place.get("geometry", {}).get("location", {}).get("lat"),
        place.get("geometry", {}).get("location", {}).get("lng"),
        place.get("types"),
    )

    # execute sql command and insert data
    cur.execute(sql_command, sql_data)

    if cur:
        print("place found: ", place.get("name"))

    # get website for the current place
    place_id = cur.fetchone()[0]
    get_review(place_id, place.get("place_id"))

    # insert city into database
    city = query.split(" ")[1]

    sql_command = """UPDATE places SET city = %s WHERE id = %s"""
    sql_data = (
        city,
        place_id
    )
    cur.execute(sql_command, sql_data)

    conn.commit()

    # make a query paus for 2 seconds
    time.sleep(2)


def get_review(place_id, google_place_id):

    # define parameter and input for place detail request
    base_url = "https://maps.googleapis.com/maps/api/place/details/json"
    parameters = {
        "key": YOUR_API_KEY,
        "place_id": google_place_id,
        "language": 'en',
    }

    print("requesting place details for place: ", place_id)

    # sending request to google api
    response = requests.get(url=base_url, params=parameters)
    data = response.json()

    if not "result" in data:
        print("no result found!")

    else:
        # insert website in database
        sql_command = """ UPDATE places SET website = %s WHERE id = %s"""

        sql_data = (
            data.get("result", {}).get("website"),
            place_id,
        )
        cur.execute(sql_command, sql_data)


if __name__ == "__main__":
    main()







