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
          13.45,
          52.520815
        ],
        zoom: 9.5
    })
    this._addMarkersToMap()
    this.map.addControl(
      new mapboxgl.GeolocateControl({
      positionOptions: {
      enableHighAccuracy: true
      },
      // When active the map will receive updates to the device's location as it changes.
      trackUserLocation: true,   
      })
      )
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