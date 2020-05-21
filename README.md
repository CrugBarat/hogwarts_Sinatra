<img src="https://github.com/CrugBarat/my_files/blob/master/hogwarts/hw_1.png" width="300"> <img src="https://github.com/CrugBarat/my_files/blob/master/hogwarts/hw_2.png" width="300"> <img src="https://github.com/CrugBarat/my_files/blob/master/hogwarts/hw_3.png" width="300">

# Hogwarts

**Programming Language**: Ruby

**Markup/Styling**: HTML5/CSS3

**Web App Framework**: Sinatra

**Db**: PostgreSQL

This exercise was tasked to me by CodeClan, Glasgow where I studied towards a PDA Level 8 in Professional Software Development. The exercise brief can be found below.

---

# Brief

Make a system for tracking student enrolments at Hogwarts.

Each student has:

- A first name
- A second name
- A house
- An age

**MVP**

- Create a Hogwarts database
- Create a table for Students
- Create a ruby model that can save() a students details
- Create some seed data to populate the database with students
- Add CRUD methods to a student

**Extensions**

- Create a view to show all the students
- Create a view to create a new student

---

# Setup

- Clone/save the repository

- Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/) and [PostgreSQL](http://www.postgresqltutorial.com/install-postgresql/)

**In Terminal**:

- Install Sinatra

```
gem install sinatra

```

- Create a hogwarts database

```
createdb hogwarts

```

- Access the hogwarts directory and create the database tables

```
psql -d hogwarts -f db/hogwarts.sql

```
- Populate the tables from the db directory

```
ruby console.rb

```

- Run the app

```
ruby controller.rb

```

- Click [localhost](http://localhost:4567/home)
