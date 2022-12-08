import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="upload-photo"
export default class extends Controller {
  static targets = ["form"]

  upload() {
    this.formTarget.submit();
  }
}
