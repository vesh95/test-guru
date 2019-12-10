categories = Category.create!([{ title: 'Backend' }, { title: 'Frontend' }])
tests = Test.create!([
  { title: 'Ruby', level: 1, category_id: categories[0].id },
  { title: 'Express', level: 2, category_id: categories[0].id },
  { title: 'ReactJS', level: 2, category_id: categories[1].id }
])

questions = Question.create([
  { body: 'Что вернёт метод select', test_id: tests[0].id },
])

Answer.create!([
  { body: 'Вервый попавшийся элемент в массиве', question_id: questions[0].id },
  { body: 'Подмассив, соответствующий условию выборки', question_id: questions[0].id }
])

user = User.create(login: 'TestUser', password_digest: 'TestPassword')
UserTest.create([
  { user_id: user.id, test_id: tests[0].id },
  { user_id: user.id, test_id: tests[1].id },
  { user_id: user.id, test_id: tests[2].id }
])

Test.create!( title: 'Owned test', category: categories[0], author: user)
