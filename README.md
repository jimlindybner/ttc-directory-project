# TTC Subway Directory 


*This application provides a directory of TTC Subway stations. From this directory, users can check the accessibility status, and the availbility of washrooms and streetcars at each station.*
Link to website: http://ttc.lindybner.com/


## Database

The database was created using MySQL and contains two tables. The first table is the users table.

Example:

| user_id | first | last | email | password | active | dateAdded |
| ------- | ----- | ---- | ----- | -------- | ------ | --------- |
| 1 | Professor | Maximus | maximus@professor.com | c4ca4238a0b923820dcc509a6f75849b | Yes | 2023-07-15 |
| 2 | Jane | Doe | jane@doe.com | 098f6bcd4621d373cade4e832627b4f6 | Yes | 2023-07-16 |

 The second table is the listing of all the subway stations and the services available at each station. 

 Example:

| station_id | station_name | washroom | accessibility | streetcar |
| ------- | ----- | ---- | ----- | -------- |
| 1 | Finch | Y | Y | N |
| 1 | North York Centre | N | Y | N |
| 1 | Sheppard-Yonge | Y | Y | N |



## Access

To access the features and functionalities of this project, different levels of user roles are defined: Super User and Admin User. The access permissions and capabilities of each user role are outlined below:

### Admin User 

An admin user can manage the station listing and station details in the system. To gain access, the admin user must first log in. Once logged in, the following actions are available:

1.	Dashboard: The super user can access the dashboard, which serves as the main control panel.
2.	TTC Subway Stations: From the dashboard, the super user can access a list of all the TTC subway stations. The super user can also add a new station to the list
3.	Station Details: When viewing the subway stations list, the super user can click on a specific station to access its details. This includes the accessibility status, availability of washrooms, and information about streetcars at each station. 
4.	Edit and Delete Station Details: On the station details page, the super user has the ability to edit and the details of any station, updating information as necessary, or delete the station from the listing

### Super User 

A super user has the highest level of access to the system. In addition to the same privileges that an admin user has, a super user can also do the following:

1.	Other Users: From the dashboard, the super user can access a list of all other users registered in the system.
2.	User Management: The super user can add or delete users from the system. The super user can also edit the details of existing users.

## Collaborators
- [williamphk](https://github.com/williamphk)
- [yanwing61](https://github.com/yanwing61)
- [SimonChung2](https://github.com/SimonChung2)
- [jimlindybner](https://github.com/jimlindybner)
