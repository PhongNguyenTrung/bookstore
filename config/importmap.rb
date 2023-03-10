# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin 'popper', to: 'popper.js', preload: true
pin 'bootstrap', to: 'bootstrap.min.js', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin 'jquery', to: 'jquery.min.js', preload: true
pin 'jquery_ujs', to: 'jquery_ujs.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'select2', to: 'https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js'
