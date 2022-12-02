import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="round"
export default class extends Controller {
  connect() {
    console.log("hello")
  }
}
