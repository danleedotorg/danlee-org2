import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
	static targets = ["navBurger", "navMenu"]

	connect() {
	}

	toggleMobileMenu() {
		this.navBurgerTarget.classList.toggle('is-active');
		this.navMenuTarget.classList.toggle('is-active');
	}
}
