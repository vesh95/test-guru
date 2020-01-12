document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.sort-by-title')
  var card_control = document.querySelector('.sort-by-header')
  if (control) { control.addEventListener('click', sortRowsByTitel) }
  if (card_control) { card_control.addEventListener('click', sortCardsByHeader) }
})

function sortCardsByHeader() {
  let testCards = $(".test-cards")
  let cards = $(".col", testCards)
  let sortedCards = []

  for (var i = 0; i < cards.length; i++) {
    sortedCards.push(cards[i])
  }

  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedCards.sort(compareCardsAsc)
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    sortedCards.sort(compareCardsDesc)
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
    this.querySelector('.octicon-arrow-up').classList.add('hide')
  }

  $(testCards).append(sortedCards);
}

function sortRowsByTitel() {
  let table = document.querySelector('table')

  // NodeList
  // https://developer.mozilla.org/en-US/docs/Web/API/NodeList
  let rows = table.querySelectorAll('tr')
  let sortedRows = []

  for (var i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc)
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
    this.querySelector('.octicon-arrow-up').classList.add('hide')
  }

  var sortedTable = document.createElement('table')

  sortedTable.classList.add('table')
  sortedTable.appendChild(rows[0])

  for(var i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i])
  }

  table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}

function compareRowsDesc(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return 1 }
  if (testTitle1 > testTitle2) { return -1 }
  return 0
}

function compareCardsAsc(card1, card2) {
  var testTitle1 = $('.card h3', card1).text()
  var testTitle2 = $('.card h3', card2).text()

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}

function compareCardsDesc(card1, card2) {
  var testTitle1 = $('.card h3', card1).text()
  var testTitle2 = $('.card h3', card2).text()

  if (testTitle1 < testTitle2) { return 1 }
  if (testTitle1 > testTitle2) { return -1 }
  return 0
}
