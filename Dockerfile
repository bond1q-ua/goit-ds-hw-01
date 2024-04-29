# Використовуємо базовий образ Python версії 3.12
FROM python:3.12.1

# Встановлюємо необхідні пакети
RUN apt-get update && apt-get install -y \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Копіюємо файли домашньої роботи в робочу директорію /app в контейнері
COPY . /app

# Встановлюємо залежності домашньої роботи
RUN pip install --no-cache-dir -r /app/requirements.txt

# Встановлюємо робочу директорію
WORKDIR /app

# Запускаємо домашню роботу як основну команду контейнера
CMD ["python", "bot.py"]
