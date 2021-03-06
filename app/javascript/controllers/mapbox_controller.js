import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
        container: this.element,
        style: "mapbox://styles/mapbox/streets-v10",
        center:[
          13.409419,
          52.520815
        ],
        zoom: 12
    })
    this._addMarkersToMap()
  }

    _addMarkersToMap() {
        this.markersValue.forEach((marker) => {
          const popup = new mapboxgl.Popup().setHTML(marker.info_window)
          new mapboxgl.Marker()
              .setLngLat([ marker.lng, marker.lat ])
              .setPopup(popup)
              .addTo(this.map)
          });
      }
}