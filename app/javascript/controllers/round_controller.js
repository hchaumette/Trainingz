import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="round"
export default class extends Controller {
  static targets = ["sets", "rest", "extime", "reps", "form", "formrest", "formtime", "formreps", "formsets"]
  connect() {
  }

  sendSets(event){
    this.formsetsTarget.value = event.target.value;
    this.update(event);
  }

  sendRest(event){
    this.formrestTarget.value = event.target.value;
    this.update(event);
  }

  sendExtime(event){
    this.formtimeTarget.value = event.target.value;
    this.update(event);
  }

  sendReps(event){
    this.formrepsTarget.value = event.target.value;
    this.update(event);
  }

  update(event){
    event.preventDefault();
    const url = this.formTarget.action ;
    console.log(url);
    fetch(url, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {

      })
    }
}
