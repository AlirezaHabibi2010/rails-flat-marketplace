import { Controller } from "@hotwired/stimulus"
import { clippingParents } from "@popperjs/core";

// Connects to data-controller="map"
export default class extends Controller {
  static values = { apiKey: String, markers: Array }

  connect() {
    console.log(this.apiKeyValue);
    console.log(this.markersValue);
    mapboxgl.accessToken = this.apiKeyValue;
    this.map = new mapboxgl.Map({
      container: this.element, // container ID
      style: "mapbox://styles/mapbox/streets-v12", // style URL
    });
    this.#addMarkersToMap();
    this.#fitMapToMarkers();

    // FIXME: This does not get triggered
    // $('#collapsableMap').on('shown.bs.collapse', () => {
    //   console.log("Toggled map")
    //   this.map.resize();
    // });

    this.map.addControl(new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl
    }));

  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
        // Print name of flat in the popup
        const popup = new mapboxgl.Popup().setHTML(marker.name)

        // Create a marker with the price
        const customMarker = document.createElement("div");
        customMarker.innerHTML = marker.marker_html;

        new mapboxgl.Marker(customMarker)
          .setLngLat([ marker.lng, marker.lat ])
          .setPopup(popup)
          .addTo(this.map)
      })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

}
