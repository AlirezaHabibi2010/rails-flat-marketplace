import { Application } from "@hotwired/stimulus"
import "/app/assets/javascripts/gallery"


const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
