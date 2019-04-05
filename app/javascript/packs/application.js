/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import Vue from 'vue'
import App from '../app.vue'
import Sidebar from '../sidebar.vue'

window.Event = new Vue();

document.addEventListener('DOMContentLoaded', () => {
  const wrapperEl = document.getElementById('editor_app');
  var el = wrapperEl.appendChild(document.createElement('hello'))

  const app = new Vue({
    el,
    render: h => h(App),
  })

  const sideBarEl = document.getElementById('sidebar_body');
  el = sideBarEl.appendChild(document.createElement('hello'))
  const sidebar = new Vue({
    el,
    render: h => h(Sidebar),
  })
})