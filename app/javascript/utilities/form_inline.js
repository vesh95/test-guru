$(document).on('turbolinks:load', function () {
  var controls = $('.form-inline-link')
  var errors = $('.resource-errors')
  if (errors.length) {
    let errorId = errors.data('object-id')
    formInlineHandler(errorId)
    $(`.test-row[data-test-id="${errorId}"]`).addClass('table-danger')
  }

  if(controls.length) {
    controls.click(formInlineLinkHandler)
  }
})

function formInlineLinkHandler(event) {
  testId = this.dataset.testId
  formInlineHandler(testId)
  event.preventDefault()
}

function formInlineHandler(testId) {
  let link = $(`.form-inline-link[data-test-id="${testId}"]`)
  let testTitle = $(`.test-title[data-test-id="${testId}"]`)
  let testForm = $(`.form-inline`, testTitle.parent())

  testTitle.toggleClass('hide')
  testForm.toggleClass('hide')
}
