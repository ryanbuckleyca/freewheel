import algoliasearch from "algoliasearch";

const algoliaSearch = () => {
  const inputField = document.querySelector("#bike_location");

  
  if (inputField) {
    const appId = document.querySelector("meta[name='algolia-app-id']").content;
    const searchOnlyApiKey = document.querySelector("meta[name='algolia-search-only-api-key']").content;
    
    console.log(searchOnlyApiKey, appId);
    const client = algoliasearch(appId, searchOnlyApiKey);
    const index = client.initIndex('Bike');
    debugger
    
    inputField.addEventListener("input", () => {
      index.search(inputField.value).then((content) => {
        console.log(content);
        // handle results however you like...
      })
    });
  }
}

export { algoliaSearch };