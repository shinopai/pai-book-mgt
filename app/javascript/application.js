// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@hotwired/turbo-rails"

// vue
import * as Vue from "vue";

const App = Vue.createApp({
    data(){
        return {
            msg: 'Hello Vue'
        }
    },
})

App.mount("#pai-book");
