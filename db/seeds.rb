test_owner = User.create!(login: 'TestOwner', password_digest: 'OwnerPassword')
categories = Category.create!([
  { title: 'Backend' },
  { title: 'Frontend' },
  { title: 'Other' },
  { title: 'AAA' }
])

tests = Test.create!([
  { title: 'Ruby', level: 1, category: categories[0], author: test_owner },
  { title: 'Express', level: 2, category: categories[0], author: test_owner },
  { title: 'ReactJS', level: 2, category: categories[1], author: test_owner },
  { title: 'Hard test 1', level: 5, category: categories[2], author: test_owner },
  { title: 'Hard test 2', level: 8, category: categories[2], author: test_owner },
])

questions = Question.create!([
  { body: 'Что вернёт метод select', test: tests[0] },
  { body: 'Что такое Express?', test: tests[1] },
  { body: 'Что делает setState?', test: tests[2] },
  { body: 'Что такое ORM?', test: tests[0] },
  { body: 'Для чего нужна библиотека Redux?', test: tests[2] }
])

Answer.create!([
  { body: 'Первый попавшийся элемент в массиве', question: questions[0], correct: true },
  { body: 'Подмассив, соответствующий условию выборки', question: questions[0] },
  { body: 'JS бекэнд фреймворк', question: questions[1], correct: true },
  { body: 'Фронтэнд фреймворк', question: questions[1] },
  { body: 'Обновляет состояние компонента', question: questions[2], correct: true },
  { body: 'Возвращает текущее состояние компонента', question: questions[2] },
  { body: 'Object relation mapping', question: questions[3], correct: true },
  { body: 'Object rational mapping', question: questions[3] },
  { body: 'Для изменения dom-объектов', question: questions[4] },
  { body: 'Для управления состоянием приложения', question: questions[4], correct: true }
])

user = User.create(login: 'TestUser', password_digest: 'TestPassword')
UserTest.create([
  { user: user, test: tests[0] },
  { user: user, test: tests[1] },
  { user: user, test: tests[2] }
])

Test.create!( title: 'Owned test', category: categories[0], author: user)

Test.create!(title: 'NoCategoryTest', author: User.find_by(login: 'TestOwner'))
