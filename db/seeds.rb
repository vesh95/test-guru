test_owner = User.create!(login: 'TestOwner', password_digest: 'OwnerPassword')
categories = Category.create!([{ title: 'Backend' }, { title: 'Frontend' }])
tests = Test.create!([
  { title: 'Ruby', level: 1, category: categories[0], author: test_owner },
  { title: 'Express', level: 2, category: categories[0], author: test_owner },
  { title: 'ReactJS', level: 2, category: categories[1], author: test_owner }
])

questions = Question.create([
  { body: 'Что вернёт метод select', test: tests[0] },
])

Answer.create!([
  { body: 'Вервый попавшийся элемент в массиве', question: questions[0] },
  { body: 'Подмассив, соответствующий условию выборки', question: questions[0] }
])

user = User.create(login: 'TestUser', password_digest: 'TestPassword')
UserTest.create([
  { user: user, test: tests[0] },
  { user: user, test: tests[1] },
  { user: user, test: tests[2] }
])

Test.create!( title: 'Owned test', category: categories[0], author: user)
