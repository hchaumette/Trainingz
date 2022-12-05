import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-workout"
export default class extends Controller {
  static targets = ["form"]


  connect() {

  }

  send(event) {
    this.formTarget.submit()
  }
}
