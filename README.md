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
   - Right-click on the main project directory.  
   - Select **Show in Local Terminal** and open it using **Git Bash**.  

3. **Clone the Repository**  
   - Clear any existing files by running:  

     ```bash  
     rm -rf ./*  
     ```  

   - Clone the project repository using the following command:
  
     ```bash  
     git clone https://github.com/youssefCOD/JEE_Pet_ShopD . --depth 1  
     ```  

4. **Format the Source Code**  
   - Right-click on the **`src`** directory.  
   - Select **Source** → **Format** in order for eclipse to recognize the new changes.  

5. **Launch the Application**  
   - Run the application in your preferred Java web server (e.g., Tomcat).  
