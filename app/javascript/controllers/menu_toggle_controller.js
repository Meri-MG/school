import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "bar1", "bar2", "bar3"]

  connect() {
    console.log("MenuToggleController connected")
  }

  toggleMenu() {
    console.log("Toggling menu")
    this.menuTarget.classList.toggle("hidden")

    // Animate hamburger to X
    this.bar1Target.classList.toggle("rotate-45")
    this.bar1Target.classList.toggle("translate-y-2")
    this.bar2Target.classList.toggle("opacity-0")
    this.bar3Target.classList.toggle("-rotate-45")
    this.bar3Target.classList.toggle("-translate-y-2")
  }
}