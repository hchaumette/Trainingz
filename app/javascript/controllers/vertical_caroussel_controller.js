import { Controller } from "@hotwired/stimulus"


// TweenMax has no dependencies here besides TweenLite, so a huge difference
import { gsap } from "gsap";

// Connects to data-controller="vertical-caroussel"
export default class extends Controller {
  static targets = ["item"]
  connect() {
    console.log(this.itemTargets)
    this.startAnim(this.itemTargets)
  }

  startAnim(array){
    if(array.length >= 4 ) {
        gsap.fromTo(array[0], 0.5, {x:0, y: 0, opacity:0.75}, {x:0, y: -120, opacity:0, zIndex: 0, delay:0.03, ease: gsap.easeInOut, onComplete: this.sortArray(array)});

        gsap.fromTo(array[1], 0.5, {x:79, y: 125, opacity:1, zIndex: 1}, {x:0, y: 0, opacity:0.75, zIndex: 0, boxShadow: '-5px 8px 8px 0 rgba(82,89,129,0.05)', ease: gsap.easeInOut});

        gsap.to(array[2], 0.5, {bezier:[{x:0, y:250}, {x:65, y:200}, {x:79, y:125}], boxShadow: '-5px 8px 8px 0 rgba(82,89,129,0.05)', zIndex: 1, opacity: 1, ease: gsap.easeInOut});

        gsap.fromTo(array[3], 0.5, {x:0, y:400, opacity: 0, zIndex: 0}, {x:0, y:250, opacity: 0.75, zIndex: 0, ease: gsap.easeInOut}, );
    } else {
        $('#card-slider').append('<p>Sorry, carousel should contain more than 3 slides</p>')
    }
  }

  sortArray(array) {
    clearTimeout(delay);
    var delay = setTimeout(function(){
        var firstElem = array.shift();
        array.push(firstElem);
        return this.startAnim(array);
    },3000)
}


}
