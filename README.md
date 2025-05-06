# Calculadora Frontend

Este é o frontend da aplicação Calculadora, desenvolvido em Flutter para web.

## Pré-requisitos

- Flutter SDK (versão mais recente)
- Docker
- Java 17 ou superior
- Maven
- Git

## Configuração do Backend (Spring Boot)

1. Clone o repositório do backend:
```bash
git clone [URL_DO_REPOSITÓRIO_BACKEND]
cd [NOME_DO_DIRETÓRIO_BACKEND]
```

2. Configure o arquivo `application.properties` com as configurações necessárias:
```properties
server.port=8080
# Adicione outras configurações necessárias
```

3. Execute o backend usando Maven:
```bash
./mvnw spring-boot:run
```

O backend estará disponível em `http://localhost:8080`

## Configuração do Frontend (Flutter)

1. Clone este repositório:
```bash
git clone [URL_DO_REPOSITÓRIO_FRONTEND]
cd front_calculadora
```

2. Instale as dependências do Flutter:
```bash
flutter pub get
```

3. Execute o aplicativo em modo de desenvolvimento:
```bash
flutter run -d chrome
```

## Build e Deploy com Docker

### Build do Frontend

1. Gere o build web do Flutter:
```bash
flutter build web
```

2. Construa a imagem Docker:
```bash
docker build -t front-calculadora .
```

3. Execute o container:
```bash
docker run -p 80:80 front-calculadora
```

O frontend estará disponível em `http://localhost:80`

## Estrutura do Projeto

```
front_calculadora/
├── lib/                    # Código fonte Dart
├── web/                    # Arquivos web
├── build/                  # Build gerado
├── pubspec.yaml           # Dependências do Flutter
└── Dockerfile             # Configuração do Docker
```

## Variáveis de Ambiente

Configure as seguintes variáveis de ambiente (se necessário):

- `API_URL`: URL do backend Spring Boot
- Outras variáveis específicas do projeto

## Scripts Úteis

- `flutter pub get`: Instala as dependências
- `flutter run -d chrome`: Executa em modo de desenvolvimento
- `flutter build web`: Gera o build para produção
- `docker build -t front-calculadora .`: Constrói a imagem Docker
- `docker run -p 80:80 front-calculadora`: Executa o container

## Troubleshooting

### Problemas Comuns

1. **Erro de CORS no backend**
   - Verifique se o backend está configurado para aceitar requisições do frontend
   - Adicione as configurações CORS apropriadas no Spring Boot

2. **Erro ao buildar o Docker**
   - Certifique-se de que o build web foi gerado corretamente
   - Verifique se o Dockerfile está no diretório correto

3. **Problemas de conexão com a API**
   - Verifique se o backend está rodando
   - Confirme se as URLs estão configuradas corretamente

## Contribuição

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`)
3. Commit suas mudanças (`git commit -m 'Adiciona nova feature'`)
4. Push para a branch (`git push origin feature/nova-feature`)
5. Abra um Pull Request

## Licença

[Adicione informações sobre a licença do projeto]
