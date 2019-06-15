/* eslint no-console:0 */

// RailsUjs is *required* for links in Lucky that use DELETE, POST and PUT.
import RailsUjs from "rails-ujs";

RailsUjs.start();

import flatpickr from "flatpickr";
import mediumZoom from "medium-zoom";

window.setupMediumZoom = function(selector) {
	mediumZoom(document.querySelectorAll(selector));
};
