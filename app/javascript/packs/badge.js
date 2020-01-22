$(document).on('turbolinks:load', function() {
  let $badges = $('.card-badge-link').on('click', badgeClick)
  let $focus = $('#badge_img_name').focus(imgNameFocus)
})

function badgeClick(event) {
  let badgeId = $(this).data('bagde-id')
  Turbolinks.visit(`/admin/badges/${badgeId}`)
}

function imgNameFocus() {
  this.select()
}
