test_owner = User.create!(email: 'TestOwner', password_digest: 'OwnerPassword')
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
  { body: 'Что вернёт метод select', test: tests[0], answers: [
    Answer.new(body: 'Первый попавшийся элемент в массиве', correct: true),
    Answer.new(body: 'Подмассив, соответствующий условию выборки'),
    Answer.new(body: 'Количество подходящих элементов'),
    Answer.new(body: 'Случайный массив')
  ]},
  { body: 'Что такое Express?', test: tests[1], answers: [
    Answer.new(body: 'JS бекэнд фреймворк', correct: true),
    Answer.new(body: 'Фронтэнд фреймворк')
  ]},
  { body: 'Что делает setState?', test: tests[2], answers: [
    Answer.new(body: 'Обновляет состояние компонента', correct: true),
    Answer.new(body: 'Возвращает текущее состояние компонента')
  ]},
  { body: 'Что такое ORM?', test: tests[0], answers: [
    Answer.new(body: 'Object relation mapping', correct: true),
    Answer.new(body: 'Object rational mapping')
  ]},
  { body: 'Для чего нужна библиотека Redux?', test: tests[2], answers: [
    Answer.new(body: 'Для изменения dom-объектов'),
    Answer.new(body: 'Для управления состоянием приложения', correct: true)
  ]}
])

# Answer.create!(body: 'Another answer', question: questions[0])

user = User.create(email: 'TestUser', password_digest: 'TestPassword')
UserTest.create!([
  { user: user, test: tests[0] },
  { user: user, test: tests[1] },
  { user: user, test: tests[2] }
])

Test.create!( title: 'Owned test', category: categories[0], author: user)

Test.create!(title: 'NoCategoryTest', author: User.find_by(email: 'TestOwner'))
