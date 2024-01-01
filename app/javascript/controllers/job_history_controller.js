import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['description', 'techUsed', 'techUsedButton', 'readButton']

  connect() {
  }

  toggleDescription() {
    if (this.descriptionTarget.classList.toggle('is-hidden')) {
      this.readButtonTarget.innerText = 'Read what I did'
    } else {
      this.readButtonTarget.innerText = 'Hide what I did'
    }
  }

  toggleTechUsed() {
    if (this.techUsedTarget.classList.toggle('is-hidden')) {
      this.techUsedButtonTarget.innerText = 'Show tech used'
    } else {
      this.techUsedButtonTarget.innerText = 'Hide tech used'
    }
  }
}
