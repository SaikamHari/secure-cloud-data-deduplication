# Secure Cloud Data Deduplication with Efficient Re-encryption

A Java-based web application focused on cloud file management, data deduplication, secure file access, and re-encryption concepts.

## 📌 Project Overview

This project demonstrates a web-based approach to managing files in a cloud-storage environment. It includes Java application components, JSP-based web pages, database connectivity, and encryption-related utilities.

The application includes workflows for users, administrators, and cloud-provider-related operations. It is intended for educational purposes and further development in secure cloud storage.

## ✨ Features

### 🔐 User and Account Management
- User registration and login pages
- Administrator login workflow
- Cloud-provider login workflow
- Account-related operations

### ☁️ Cloud File Management
- File upload and download workflows
- File access and management pages
- Cloud-provider-related operations
- File-related status and request pages

### 🔒 Encryption and Key Handling
- Encryption and decryption components
- Key-handling utility classes
- Re-encryption-related project concepts

### 🛡️ Auditing and Administration
- Auditing-related pages
- Administrative workflows
- File request and approval-related pages

> Feature descriptions should be confirmed against the running application before presenting this project as production-ready.

## 🛠️ Technologies Used

- **Language:** Java
- **Web interface:** JavaServer Pages (JSP), HTML, CSS, and Java web components
- **Build tool:** Apache Ant
- **IDE configuration:** NetBeans
- **Database:** MySQL
- **Application server:** Apache Tomcat
- **Version control:** Git and GitHub

## 🏗️ System Architecture

```text
       ┌───────────────────────────┐
       │       Web Browser         │
       │     JSP / HTML Pages      │
       └─────────────┬─────────────┘
                     │
                     ▼
       ┌───────────────────────────┐
       │      Java Web Layer       │
       │ Login / File Operations   │
       │ Administration / Auditing │
       └─────────────┬─────────────┘
                     │
            ┌────────┴────────┐
            ▼                 ▼
   ┌─────────────────┐  ┌─────────────────┐
   │ Encryption and  │  │  MySQL Database │
   │ Key Utilities   │  │   Persistence   │
   └─────────────────┘  └─────────────────┘
```

*Conceptual overview; confirm the exact component interactions in the source code.*

## 📁 Project Structure

```text
Secure-Cloud-Data-Deduplication/
├── src/
│   └── java/             # Java source files
├── web/
│   ├── WEB-INF/
│   │   └── web.xml       # Web application configuration
│   ├── META-INF/
│   │   └── context.xml   # Context configuration
│   └── *.jsp             # Web interface pages
├── nbproject/            # NetBeans project configuration
├── build.xml             # Apache Ant build file
├── .gitignore
└── README.md
```

## 🚀 Getting Started

### Prerequisites

Install the following tools:

- Java JDK compatible with the project (Java 8 was used for validation)
- Apache Ant
- Apache Tomcat compatible with the application
- MySQL Server
- MySQL JDBC driver

### 1. Get the project

After the repository is published, clone it using its actual GitHub URL:

```powershell
git clone <YOUR_GITHUB_REPOSITORY_URL>
cd <YOUR_PROJECT_FOLDER>
```

### 2. Configure the database

1. Start MySQL.
2. Create the database required by the application.
3. Prepare the required tables and test data.
4. Configure the database connection locally.
5. Verify that the MySQL JDBC driver is available to the application.

The required schema must be confirmed from the project's SQL files or existing database setup.

### 3. Configure local credentials

Before running the application, review the database connection, encryption-key utilities, mail configuration, and `web/META-INF/context.xml`.

Use local configuration or environment variables for credentials where the code supports them. Never commit real passwords, private keys, or API credentials.

### 4. Build the application

From the project root, run:

```powershell
ant compile
```

If the build fails, check the Java version, Ant configuration, dependencies, and any files locked by the IDE or Tomcat.

### 5. Deploy to Tomcat

Use the deployment target defined in `build.xml`, or configure deployment through the project's NetBeans setup.

Start Tomcat and open the application's configured local URL.

The exact deployment target and URL should be confirmed from the project configuration.

## 📸 Screenshots

Add genuine screenshots of the running application to the `screenshots/` directory.

Suggested screenshots:

| Screenshot | What to capture |
|---|---|
| `LandingPage.png` | Application home page |
| `Login.png` | Login page with no real credentials |
| `Dashboard.png` | Main page after test login |
| `FileUpload.png` | File upload workflow |
| `FileDownload.png` | File download workflow |
| `Admin.png` | Administrative page using test data |

Once the screenshots exist, display them here by adding Markdown image links. For example:

```markdown
![Application home page](screenshots/LandingPage.png)
```

Do not include real passwords, personal records, private keys, or sensitive database details in screenshots.

## 🔒 Security Considerations

- Keep database credentials outside tracked source files.
- Never commit email passwords, API tokens, or private encryption keys.
- Use synthetic test accounts and test files for demonstrations.
- Review encryption and key-management logic before handling real data.
- Check the repository history for previously committed secrets before making the repository public.
- Treat this project as educational unless a security review confirms otherwise.

## 🧪 Testing and Validation

Before publishing, verify:

- [ ] The project builds successfully.
- [ ] The application starts in the intended Tomcat environment.
- [ ] Database connectivity works.
- [ ] Login and file workflows work with test data.
- [ ] Encryption and decryption workflows are tested.
- [ ] Error handling is checked.
- [ ] Credentials and private configuration are excluded from Git.

## 🎯 Future Improvements

- Externalize hardcoded credentials and encryption keys.
- Document database schema creation and sample data.
- Add automated tests for file operations and encryption workflows.
- Improve input validation and error handling.
- Add verified application screenshots.
- Document reproducible build and deployment steps.
- Review cryptographic choices and key management.

## 👨‍💻 Developer

**Developer:** Saikam Hari

**Focus:** Java development and secure cloud-storage concepts

GitHub: [SaikamHari](https://github.com/SaikamHari)

LinkedIn: [Hari Saikam](https://www.linkedin.com/in/hari-saikam/)

## 📄 License

No license has been selected for this repository yet. Choose and add an appropriate license before granting others permission to reuse or distribute the code.
