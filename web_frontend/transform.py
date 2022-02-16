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

        texts = [element.text for element in tour.find('texts')]

        # coordinates
        coordinates = []
        coordinates.append(tour.find('geo/main').attrib["longitude"])
        coordinates.append(tour.find('geo/main').attrib["latitude"])

        # prepare the tour
        dataset = {
            "id": tour.find('id').text,
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

        # add the tour
        tourlist.append(dataset)


page = 1
per_page = 30

# json output dict
output = {
    "data": {
        "total": len(tourlist),
        "page": page,
        "per_page": per_page,
        "items": []
    }
}

count = 0
random.shuffle(tourlist)

for tour in tourlist:

    count = count + 1
    output['data']['items'].append(tour)

    # we really only want to have a certain number of tours in a api request, so we write it out here
    if count == 100:
        with open("./api/" + str(page) + '.json', 'w') as f:
            json.dump(output, f)

            page = page + 1
            count = 0

            output['data']['items'] = []
            output['data']['page'] = page


# all the remaining tours will be added as well
with open("./api/" + str(page) + '.json', 'w') as f:
    json.dump(output, f)
    output['data']['page'] = page + 1

# done, over and out
