import { Controller } from "@hotwired/stimulus"
import Glide from '@glidejs/glide'

// Connects to data-controller="carousel"
export default class extends Controller {
  static values = {
    number: Number
  }

  connect() {
    let glide = new Glide(`.glide${this.numberValue}`, {
      type: 'slider',
      perView: 1,
      focusAt: 'center',
      gap: 10,
      breakpoints: {
        800: {
          perView: 2
        },
        480: {
          perView: 1
        }
      }
    })

    glide.mount()
  }

}
