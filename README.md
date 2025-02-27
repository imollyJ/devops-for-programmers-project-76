### Hexlet tests and linter status:
[![Actions Status](https://github.com/imollyJ/devops-for-programmers-project-76/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/imollyJ/devops-for-programmers-project-76/actions)

# DevOps for Programmers: Project 76

## 📌 Описание проекта
Этот проект автоматизирует развертывание Redmine в Docker-контейнере на серверах Ubuntu с помощью Ansible. Также осуществляется мониторинг с помощью Datadog, включая установку агента и настройку HTTP Check.

## 🛠️ Стек технологий
- **Ubuntu** – ОС для развертывания сервиса
- **Ansible** – автоматизация развертывания
- **Docker** – контейнеризация приложения
- **Datadog** – мониторинг и логирование

---

## 🚀 Установка и развертывание

### 1️⃣ Установка зависимостей
Перед началом работы установите:
- `ansible`
- `docker`
- `docker-compose`

### 2️⃣ Настройка Ansible
#### Установка коллекций Ansible:
```sh
ansible-galaxy collection install -r requirements.yml
```

#### Настройка хостов (`hosts.yml`)
Создайте файл `hosts.yml` с вашими серверами:
```yaml
all:
  children:
    webservers:
      hosts:
        web1:
          ansible_host: 192.168.1.10
```

#### Шифрование секретов
```sh
ansible-vault encrypt group_vars/webservers/vault.yml
```

### 3️⃣ Запуск плейбука
```sh
ansible-playbook -i hosts.yml playbook.yml --vault-password-file vault-pass.txt
```

---

## 📊 Мониторинг с Datadog
### Установка агента Datadog
Datadog-агент устанавливается через Ansible:
```yaml
roles:
  - { role: datadog.datadog, become: yes }
vars:
  datadog_api_key: "YOUR_API_KEY"
```

### Настройка HTTP Check
Файл `templates/http_check.yaml.j2`:
```yaml
init_config:
instances:
  - name: Redmine Check
    url: http://localhost:3000
    timeout: 5
    method: GET
```

### Перезапуск агента
```sh
systemctl restart datadog-agent
```

---

