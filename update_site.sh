#!/bin/bash

# Рендеринг страниц с Quarto
echo "Рендеринг страниц..."
quarto render

# Проверка, что рендеринг завершен успешно
if [ $? -eq 0 ]; then
    echo "Рендеринг завершен успешно."

    # Добавление файлов в Git
    echo "Добавление файлов в Git..."
    git add .

    # Коммит изменений
    echo "Коммит изменений..."
    git commit -m "Обновление страниц с рендерингом в папку docs"

    # Отправка изменений на GitHub
    echo "Отправка изменений на GitHub..."
    git push origin main

    # Проверка успешной отправки
    if [ $? -eq 0 ]; then
        echo "Изменения успешно отправлены на GitHub!"
    else
        echo "Ошибка при отправке изменений на GitHub."
    fi
else
    echo "Ошибка рендеринга страниц. Пожалуйста, проверьте файлы."
fi
