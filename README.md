# Pet Shop Application Setup Guide  

Follow these steps to set up and run the Pet Shop application:  

## Prerequisites  

- Ensure you have a Java development environment installed.  
- Install Git on your system.  
- Use **Git Bash** as the terminal for the setup process.  

## Steps  

1. **Create a Dynamic Web Project**  
   - Create a new **Dynamic Web Project** in your development environment.  
   - Name the project **`pet-shop`**.  
   - Use **Java EE version 2.4** for compatibility.  

2. **Navigate to the Project Directory**  
   - Right-click on the **`src`** project directory.  
   - Select **Show in Local Terminal** and open it using **Git Bash**.  

3. **Clone the Repository**  
   - Clear any existing files by running:  

     ```bash  
     rm -rf ./*  
     ```  

   - Clone the project repository using the following command:  

     ```bash  
     git clone https://github.com/youssefCOD/JEE_Pet_Shop . --depth 1  
     ```  

4. **Format the Source Code**  
   - Right-click on the **`src`** directory.  
   - Select **Source** → **Format** to ensure Eclipse recognizes the new changes.  

5. **Set Up the Database**  
   - Launch MySQL using a management tool like **XAMPP** or **WAMP**.  
   - Open **phpMyAdmin** and create a new database named **`animal_shop_2024`**.  
   - Locate the **`main.sql`** file in the project repository.  
   - Copy its content and paste it into the **SQL** section of the **`animal_shop_2024`** database.  
   - Execute the SQL script to create the required tables and populate the database.  

6. **Launch the Application**  
   - Run the application in your preferred Java web server (e.g., Tomcat).  

---

## Assignment Requirements  

For the **Projet JEE**, ensure the following deliverables are included in a shared drive folder:  

1. **Code Source**: Include the full source code of the application in the folder.  
2. **Mini Report**: Provide a concise report detailing:  
   - Project objectives and functionality.  
   - Development process and tools used.  
   - Challenges faced and solutions implemented.  
3. **Demonstration Video**: Record a video showcasing the application's main features and functionalities.  
4. **Team Members File**: Add a plain text file (**`.txt`**) listing the names of all team members involved in the project.  

