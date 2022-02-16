import xml.etree.cElementTree as ET
import json
import random

# transforms the Tour_de.xml (not in this repo) to a smaller json file
# this time in python and not PHP due to size issues...

tree = ET.parse('./Tour_de.xml')
root = tree.getroot()
tours = root.findall('items/item')
tourlist = []

r = 0
# loop through all tours
for tour in tours:
    # array of categories
    categories = [element.text for element in tour.find('categories')]
    geometry = tour.find('geo/geometry')

    # we only are interested in wanderwege
    if 'Wanderweg' in categories and geometry is not None:

        r = r+1

        id = tour.find('id').text
        texts = [element.text for element in tour.find('texts')]

        # coordinates
        coordinates = []
        coordinates.append(tour.find('geo/main').attrib["longitude"])
        coordinates.append(tour.find('geo/main').attrib["latitude"])

        # prepare the tour
        dataset = {
            "id": id,
            "title": tour.find('title').text,
            "categories": categories,
            "text": texts[1],
            "city": tour.find('city').text,
            "url": tour.find('web').text,
            "geo": {
                "main": coordinates,
                "geometry": tour.find('geo/geometry').text
            },
            "ratings": [{"type": element.attrib["type"], "rating": element.text} for element in tour.find('ratings/rating')]
        }

        # save the tour to api
        with open("./api/tour/" + str(id) + '.json', 'w') as f:
            json.dump({"data": dataset}, f)

        # add the tour
        tourlist.append(dataset)


page = 1
per_page = 30

# json output dict
output = {
    "data": {
        "total": len(tourlist),
        "items": []
    }
}

count = 0
random.shuffle(tourlist)

for tour in tourlist:
    output['data']['items'].append({
        "id": tour['id'],
        "title": tour['title'],
        "city": tour['city'],
        "coordinates": tour['geo']['main'],
    })

with open('./api/all.json', 'w') as f:
    json.dump(output, f)
