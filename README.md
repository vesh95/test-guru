# Test-Guru
Учебный проект из интенсива от Thinknetica

## Установка и запуск
**Установка зависимостей**

```sh
./bin/yarn install
./bin/bundle
```

**Запуск сервера**

`./bun/rails s`

## Список сущностей

### Пользователь
Имеет свое имя и группу. Аутентифицирует пользователя.
* login - логин пользователя (not null)
* password_digest - хэш пароля пользователя

### Тест
Основная сущность
* title - название теста (not null)
* level - уровень теста (default: 1)
* categoy - категория
* author - автор теста

### Вопрос
Вопросы принадлежат тестам, содержат текст вопросов и список ответов
* body - текст вопроса (not null)
* test - тест, к которому относится вопрос (not null)

### Ответ
Связаны с вопросом, содержат текст ответов
* body - текст ответа (not null)
* question - вопрос, к которому принадлежит ответ (not null)
* correct - отметка правильного ответа (default: false, not null)

### Результат
Содержит результаты прохождения теста


### Категория
Указывает к какой категории относится тест
* title - название категории (null false)
