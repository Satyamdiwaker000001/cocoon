# Development Guide

## Setup & Prerequisites

### Tools Required
- **Flutter SDK**: >= 3.0.0
- **JDK**: 17+ (for Spring Boot backend)
- **Python**: 3.10+ (for FastAPI AI service)
- **Docker & Docker Compose**

## Quickstart

### Running services locally with Docker
```bash
docker-compose up --build
```

### Running individual modules

#### Frontend (Flutter App)
```bash
cd frontend/flutter_app
flutter run
```

#### Backend (Spring Boot)
```bash
cd backend/springboot
./gradlew bootRun # or ./mvnw spring-boot:run
```

#### AI Service (FastAPI)
```bash
cd ai-service/fastapi
pip install -r requirements.txt
uvicorn app.main:app --reload
```
