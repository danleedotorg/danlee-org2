import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
	static targets = ['description']

	connect() {
		console.log(this.descriptionTarget)
	}

	toggleDescription() {
		this.descriptionTarget.classList.toggle('is-hidden')
	}

}
