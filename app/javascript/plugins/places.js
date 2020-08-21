import places from 'places.js';
const initAlgoliaPlaces = () => {
  var places = require('places.js');
  var placesAutocomplete = places({
  container: document.querySelector('#bike_location')
  });
}

export { initAlgoliaPlaces }; 