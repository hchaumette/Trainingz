import { Controller } from "@hotwired/stimulus"
import { gsap } from "gsap";


// Connects to data-controller="vertical-caroussel"
export default class extends Controller {
  static targets = ["circle", "button", "allImgs", "allDots"]
  connect() {
    console.log(this.wholeTimeValue)
    this.currentStepValue = 0;
    this.tlValue = gsap.timeline();
    this.intervalTimer;
    this.timeLeft;
    this.wholeTimeValue = 8;
    this.isPausedValue = false;
    this.isStartedValue = false;
    this.radiusValue = 28;
    this.initialOffsetValue = Math.PI * 2 * this.radiusValue;

    if (this.circleTarget) {
      this.wholeTimeValue = parseInt(this.circleTarget.dataset.time, 10);
      this.animateTimer();
      this.pauseTimer();
    }
  }

  animateTimer() {
    this.tlValue.to("#circle", {
      duration: this.wholeTimeValue,
      startAt: {
        strokeDashoffset: this.initialOffsetValue
      },
      strokeDashoffset: 0,
      repeat: -1,
      ease: "linear",
      onComplete: this.tlValue.invalidate
    });
  }
  changeBackground() {
    this.allDotsTargets.forEach((dot) => {
      dot.classList.remove("active");
    })

    this.allDotsTargets[this.currentStepValue].classList.add("active");

    this.allImgsTargets.forEach((img) => {
        img.classList.add("d-none");

    })

    this.allImgsTargets[this.currentStepValue].classList.remove("d-none");
  }

  moveStep(event) {
    const ul = event.currentTarget.parentElement;
    const nodes = Array.from( ul.children );
    const btnIndex = nodes.indexOf( event.currentTarget );

    this.currentStepValue = btnIndex;
    this.changeBackground();
    clearInterval(this.intervalTimer);
    this.isStartedValue = false;
    this.isPausedValue = false;
    this.tlValue.pause(0);
    this.pauseTimer();
  }

  timer(seconds) {
    this.remainTime = Date.now() + seconds * 1000;
    // let tl = gsap.timeline();

    this.intervalTimer = setInterval(() => {
      this.nextStep();
    } , 10);
  }

  nextStep() {
    this.timeLeft = ((this.remainTime - Date.now()) / 1000).toFixed(2);
    if (this.timeLeft <= 0) {
      this.tlValue.restart();
      clearInterval(this.intervalTimer);
      this.isStartedValue = false;
      this.currentStepValue = this.currentStepValue + 1 < this.allImgsTargets.length ? this.currentStepValue + 1 : 0;
      this.pauseTimer();
      this.changeBackground();
      return;
    }
  }




  pauseTimer() {
    if (this.isStartedValue === false) {
      this.timer(this.wholeTimeValue);
      this.isStartedValue = true;
      this.buttonTarget.classList.remove("play");
      this.buttonTarget.classList.add("pause");
      this.tlValue.paused(false);
    } else if (this.isPausedValue) {
      this.buttonTarget.classList.remove("play");
      this.buttonTarget.classList.add("pause");
      this.timer(this.timeLeft);
      this.isPausedValue = this.isPausedValue ? false : true;
      this.tlValue.paused(this.isPausedValue);
    } else {
      this.buttonTarget.classList.remove("pause");
      this.buttonTarget.classList.add("play");
      clearInterval(this.intervalTimer);
      this.isPausedValue = this.isPausedValue ? false : true;
      this.tlValue.paused(this.isPausedValue);
    }
  }
}
