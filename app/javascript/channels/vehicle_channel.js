import consumer from "./consumer"

$(document).on('turbolinks:load', function () {
})

document.addEventListener('turbolinks:load', () => {
  const vehicle_element = document.getElementById('vehicle-id');
  const vehicle_id = vehicle_element.getAttribute('data-vehicle-id');

  consumer.subscriptions.subscriptions.forEach((subscription) => {
    consumer.subscriptions.remove(subscription)
  })

  consumer.subscriptions.create({ channel: "VehicleChannel", vehicle_id: vehicle_id }, {
    connected() {
      // specify the connection with particular vehicle
      console.log("Connected with Vehicle " + vehicle_id);
    },

    disconnected() {
      // specify the disconnection with particular vehicle
      console.log("Disconnected with Vehicle " + vehicle_id);
    },

    received(data) {

      let response = data.response;
      console.log(response);
      // Here we have the data response when action cable is being called in location controller

      // If we have the AllOK response then we'll append the innerHTML
      if (response == "AllOK") {
        const locationContainer = document.getElementById('locations')
        locationContainer.innerHTML = locationContainer.innerHTML + data.location_html
        locationContainer.scrollTop = locationContainer.scrollHeight;
        const responseContainer = document.getElementById('response')
        responseContainer.innerHTML = "Created Record with : " + response
        const locationCountContainer = document.getElementById('location-count')
        locationCountContainer.innerHTML = (parseInt(locationCountContainer.innerHTML) + 1 )
        console.log("Appended");

      } else if (response == "LessThan3Seconds" || response == "RecordNotSave" || response == "ExceedCityBoundaries") {
        const responseContainer = document.getElementById('response')
        if (response == "ExceedCityBoundaries") {
         response =  "ExceedCityBoundaries (PS: Please Enter with range of 3.5 KM eg: [Latitude: 52.54, Longitude: 13.403] for door2door station)"
        }
        responseContainer.innerHTML = "Got an Error of : " + response
        alert(response);
      } else if (response == "RecordNotSave") {
        alert(response);
      } else if (response == "ExceedCityBoundaries") {
        alert(response);
      }
    }
  });
});
