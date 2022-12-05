import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="share-button"
export default class extends Controller {
  static targets = ["shared"]

  connect() {

  }


  sharing(event) {
    console.log(event)


  }
}
