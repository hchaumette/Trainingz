import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-exercise"
export default class extends Controller {
static targets = ["exercise"]



  connect() {
    console.log(this.exerciseTargets)
    console.log(this.exerciseTargets[0].dataset.exerciseId);

  }

  select(event){
    event.preventDefault();
    console.log("selected");


    event.currentTarget.classList.toggle('selected-exercise')

    if (event.currentTarget.dataset.selected === true) {
      event.currentTarget.dataset.selected = false
    } else {
      event.currentTarget.dataset.selected = true
    }

  }

  confirm() {
    console.log("confirmed");
    this.exerciseTargets.forEach((exercise)=> {

      if (exercise.dataset.selected === "true") {
        console.log("FETCH");
      }
    })

  }
}
