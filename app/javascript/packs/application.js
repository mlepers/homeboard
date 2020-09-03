// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
//= require rails-ujs
//= require ./cable.js

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "../plugins/flatpickr"
import { initChatroomCable } from "../channels/chatroom_channel";
import { scrollLastMessage } from "../channels/chatroom_channel";
import { initNotificationCable } from "../channels/notification_channel";
import { pressEnterSubmit } from "../plugins/enterbutton"
import { changeArrow } from "../plugins/arrow"
import {changeCategory} from "../plugins/category_choice"
import { initSweetalertCreated } from '../plugins/initSweetAlertCreated';
import { alertAnimation } from "../plugins/alertAnimation"
import { topmenu } from "../plugins/topmenu"

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  alertAnimation();
  scrollLastMessage();
  initChatroomCable();
  pressEnterSubmit();
  initNotificationCable();
  changeArrow();
  changeCategory();
  initSweetalertCreated('#sweet-alert-created', {
    title: "Service Created",
    text: "Well done, you created a new service for the community.",
    icon: "success",
    button: 'Ok',
    confirmButtonColor: '#009688'
  });
});
