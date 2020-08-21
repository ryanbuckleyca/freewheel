import places from 'places.js';
const initAlgoliaPlaces = () => {
  const input = document.querySelector('#bike_location');
  if (input) {
    var placesAutocomplete = places({
      container: input
    });
  }
}

export { initAlgoliaPlaces };
