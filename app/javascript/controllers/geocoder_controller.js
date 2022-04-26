import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

export default class extends Controller {
  static values = { apiKey: String }

  static targets = ["address"]

  connect() {
    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "region,place,postcode,locality,neighborhood,address",
      countries: "de",
      bbox: [ 12.911949, 52.302299,  13.835358, 52.742648 ]
    });
    this.geocoder.addTo(this.element)

    this.geocoder.on("result", event => this._setInputValue(event))
    this.geocoder.on("clear", () => this._clearInputValue())
  }

  _setInputValue(event) {
    this.addressTarget.value = event.result["place_name"]
  }

  _clearInputValue() {
    this.addressTarget.value = ""
  }
}