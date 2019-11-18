import('@rails/ujs').then( ujs => ujs.start() )
import('turbolinks').then( turbolinks => turbolinks.start() )
import('@rails/activestorage').then( activestorage => activestorage.start() )

const images = require.context('../images', true)
const imagePath = (name) => images(name, true)

$(() => {
  $(document).trigger('turbolinks:load'); // make sure turbolinks:load fired at first page loaded

  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
})