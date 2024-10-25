@echo off

chcp 65001

REM Переход в нужную директорию

cd /d d:\


if not exist gpt4freePatch mkdir gpt4freePatch

cd /d d:\gpt4freePatch


REM Download copy-patch repository

curl -L --output gpt4free-copy-patch.zip https://github.com/foxfire52/gpt4free/archive/refs/heads/copy-patch.zip


REM Unzip

tar -xf gpt4free-copy-patch.zip



REM Проверка наличия Python

where python >nul 2>nul

if errorlevel 1 (

    echo Python не найден. Пожалуйста, установите Python и добавьте его в PATH.

    exit /b

)


REM Проверка на существование виртуального окружения

if exist venv (

    echo Виртуальное окружение уже существует. Активируем его...

) else (

    echo Создаем новое виртуальное окружение...

    python.exe -m venv venv

)


REM Активация виртуального окружения

call venv\Scripts\activate


REM Установка зависимостей

pip install -r gpt4free-copy-patch\requirements.txt


REM Install from folder

pip install -U -e gpt4free-copy-patch\


REM Запуск скрипта

python -m g4f.gui.run


REM Деактивация виртуального окружения

deactivate



pause
