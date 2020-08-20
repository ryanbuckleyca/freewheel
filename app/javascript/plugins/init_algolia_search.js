// import algoliasearch from "algoliasearch";

// const algoliaSearch = () => {
//   const inputField = document.querySelector("#bike_location");

  
//   if (inputField) {
//     const appId = document.querySelector("meta[name='algolia-app-id']").content;
//     const searchOnlyApiKey = document.querySelector("meta[name='algolia-search-only-api-key']").content;
    
//     const client = algoliasearch(appId, searchOnlyApiKey);
//     const index = client.initIndex('Bike');
    
//     inputField.addEventListener("input", () => {
//       index.search(inputField.value).then((content) => {
//         console.log(content);
//         // handle results however you like...
//       })
//     });
//   }
// }

// export { algoliaSearch };

import places from 'places.js';
const algoliaSearch = () => {
  var placesAutocomplete = places({
    // appId: 'plWXWVLRSZDV',
    // apiKey: '2c640dab10c5f1d28d1c0194cd11ca02',
    container: document.querySelector('#bike_location')
  });
}
export { algoliaSearch };